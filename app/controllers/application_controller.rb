class ApplicationController < ActionController::API
    def current_user
        begin
            @current_user ||= User.find(session[:user_id]) if session[:user_id]
        rescue Exception => e
            nil
        end
    end

    def user_signed_in?
        return true if current_user
    end

    def correct_user?
        @user = User.find(params[:id])
        unless current_user == @user
            redirect_to root_url, :alert => "Access denied."
        end
    end

    def authenticate_user!
        if !current_user
            redirect_to root_url, :alert => 'You need to sign in for access to this page.'
        end
    end


    def logging
        id = ENV["DISCORD_CLIENT_ID"]
        secret = ENV["DISCORD_CLIENT_SECRET"]
    end
end
