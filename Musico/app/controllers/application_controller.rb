class ApplicationController < ActionController::Base
    before_action :check_login, except: [:login, :new, :validate , :create]
    
    private
    def check_login
        if(session[:user_id] == nil)
            redirect_to login_path
        end
    end
end
