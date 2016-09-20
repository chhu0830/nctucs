class CallbacksController < Devise::OmniauthCallbacksController
  def CS
    if current_user
      alertmesg('info', 'warning', "您已登入")
      redirect_to :root
      return
    end

    result = User.from_omniauth(params[:id], params[:pw])
    flash[:notice] = result[:msg]
    if result[:auth]
      _additional_session(result[:user])
      sign_in_and_redirect result[:user], :event => :authentication
    else
      redirect_to :root
    end
  end

  private

  def _additional_session(user)
    store_location_for(:user, session[:last_url])
    session[:auth_cs] = user.try(:auth_cs).try(:to_session_json)
  end
end
