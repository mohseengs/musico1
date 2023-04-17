module SpecTestHelper   
    def login_admin
        login(:admin)
      end
    
    def check_login
        true
    end
      def login(user)
        session[:user_id] = user.id
      end
    
      def current_user
        User.last
      end
end
RSpec.configure do |config|
    config.include SpecTestHelper, type: :controller
end