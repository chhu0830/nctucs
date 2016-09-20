require 'omniauth'

module OmniAuth
  module Strategies
    class CS
      include OmniAuth::Strategy

      def callback_phase
        super
      end

      def auth_hash
        OmniAuth::Utils.deep_merge(super(), {
        })
      end
    end
  end
end
