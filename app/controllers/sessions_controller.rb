class SessionsController < ApplicationController

    def create
        @user = User.find_by(name: params[:user][:name])
        if !@user.nil? && @user != ""
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/'
        else
            redirect_to '/login'
        end
    end
end