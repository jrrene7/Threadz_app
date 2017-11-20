class SessionsController < ApplicationController
  before_action :logged_in, only: [:new]
def index

end

def show

end

def new

end

def create
  @user = User.find_by_email(params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
       session[:user_id] = @user.id
        redirect_to @user
    else
      redirect_to login_path
    end
end

def destroy
  session[:user_id] = nil
  redirect_to login_path
end
end
