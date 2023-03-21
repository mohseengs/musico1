class ApplicationController < ActionController::Base
    before_action :check_login
    
    protected
    def check_login
        if(session[:user_id] == nil)
            redirect_to login_path
        end
    end
end
