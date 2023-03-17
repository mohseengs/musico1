class ApplicationController < ActionController::Base
    before_action :check_login, except: [:login, :new, :validate , :create]
    
   

    private
    def check_login
        if(session[:user_id] == nil)
            redirect_to login_path
        end
    end

    def search(models, query) 
        result = []
        models.each do |hash|
            hash[:column].each do |column|
                #result.push(hash[:model].where("#{column}": query )) runned not returned
                #result.push(hash[:model].where("#{column} LIKE #{query}" ))
                result.push(hash[:model].where("#{column} LIKE ?", "%" + query + "%"))
            end
        end
        return result
    end
end
