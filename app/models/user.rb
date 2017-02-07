class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :comments, :dependent=>:destroy
	has_many :viewlists, :dependent=>:delete_all
	has_many :boards, :through=>:viewlists
	has_many :categories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

	def admin?
		return self.role & 0b001 == 0b001
	end

	def leader?
		return self.role & 0b010 == 0b010
	end

	def normal?
		return self.role & 0b100 == 0b100
	end

  def to_session_json
    return {
      :student_id => self.student_id,
      :account => self.account
    }
  end

  def self.from_omniauth(account, password)
    if !account or !password
      return {:auth=>false, :msg=>"帳號或密碼不可留白"}
    end
    require 'open-uri'
    require 'net/http'
    info = {:id=>account, :pw=>password, :dep=>"cs"}
    res = Curl.post("http://people.cs.nctu.edu.tw/~associat/oldexam/auth.php", info)
    if res.body_str == "false"
      return {:auth=>false, :msg=>"登入失敗"}
    else
      data = JSON.parse(res.body_str)
      user = where(:student_id => data['csid']).first_or_initialize.tap do |u|
        u.name = data['name']
        u.account = data['uid']
        u.student_id = data['csid']
        u.email = "#{Devise.friendly_token[0,8]}@please.change.me"
        u.password = "Devise.friendly_token[0,20]"
				u.role = 0b100
        u.save!
      end
      return {:auth=>true, :user=>user, :msg=>"登入成功"}
    end

  end
end
