class UsersController < ApplicationController
  before_action :require_user, only: [:show, :index]
  before_action :logged_in, only: [:show, :index]


  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def new
   @user = User.new
  end

 def create
   @user = User.new(user_params)
   if @user.save
     session[:user_id] = @user.id
     redirect_to @user
   else
     redirect_to signup_path
   end
 end


 def search
   @users = User.where('LOWER(name) LIKE ?', "%#{params[:q].downcase}%").order(:name)
   render :json => {:users => @users}
 end

 private
   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
end
