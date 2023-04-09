class ApplicationController < ActionController::Base
    before_action :check_login

    private
    def check_login
        if(!session[:user_id])
            redirect_to login_path , notice: "login first to access"
        end
    end
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
    helper_method :current_user

    def current_song
        if current_user
            @current_song = current_user.song_queue.songs.order(created_at: :asc).limit(1).offset(current_song_pointer).first
        end
    end
    helper_method :current_song

    def current_song_pointer 
        @current_song_pointer = current_user.song_queue.current_pointter || 1
    end
    helper_method :current_song_pointer

    def song_queue_size
        current_user.song_queue.songs.count
    end
    helper_method :song_queue_size

end
