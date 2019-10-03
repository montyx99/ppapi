require 'json'

class SessionsController < ApplicationController
    def new
        redirect_to '/auth/discord'
    end
    
    def current_user
        super
    end

    def create
        session[:init] = true
        auth = request.env["omniauth.auth"]
        user = User.where(:discord_id => auth.extra.raw_info.id).first || User.create_with_omniauth(auth)
        p user
        p user.discord_id
        # Reset the session after successful login, per
        # 2.8 Session Fixation – Countermeasures:
        # http://guides.rubyonrails.org/security.html#session-fixation-countermeasures
        reset_session
        session[:user_id] = user.discord_id
        p session[:user_id]
        redirect_to "http://localhost:3000", :notice => 'Signed in!'
    end

    def destroy
        reset_session
        redirect_to "http://localhost:3000", :notice => 'Signed out!'
    end

    def failure
        redirect_to "http://localhost:3000", :alert => "Authentication error: #{params[:message].humanize}"
    end

    def logininfo
        p current_user
        if current_user
            render :json => true, :status => 200
        else
            render :json => false, :status => 401
        end
    end
end