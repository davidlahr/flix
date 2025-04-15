class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]
  before_action :require_signin, except:[:new, :create]
  before_action :require_correct_user, only:[:edit, :update]
  before_action :require_admin, only:[:destroy]

  def require_signin
    unless current_user
      redirect_to new_session_url, alert: "Please Sign in First!"
    end
  end


  def index
    @users = User.not_admins
  end

  def new
    @user = User.new
  end

  def show
    @reviews = @user.reviews
    @favorite_movies = @user.favorite_movies
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thanks for Signing Up!"
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  def edit
    
  end

  def update
    
    if @user.update(user_params)
      redirect_to @user, notice: "User Succesfully Updated!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    # session[:user_id] = nil
    redirect_to users_url, method: :get, status: :see_other, alert: "Member successfully deleted"
  end
  
  

  private

  def require_correct_user
    redirect_to movies_url unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end





end
