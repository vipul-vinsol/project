class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:edit, :update]
  before_action :authenticate_admin, only: [:show, :index, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @all_topics = Topic.all.map { |topic| [topic.name, topic.id] }
    @user.build_detail
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.activation_token = SecureRandom.urlsafe_base64.to_s
    if @user.save
      @user.assign_interests(params[:user][:interests])
      UserMailer.user_activation_email(@user).deliver_now
      redirect_to login_path, 
          notice: 'User was successfully created. Please confirm with email to activate user'
    else
      render :new
    end
  end

  def activation
    user = User.find_by_activation_token(params[:id])
    if user
      user.activate
      flash[:success] = "Welcome to the Quora Clone!, Please login to continue."
      redirect_to root_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end

  def update
    if @user.update(user_params)
        redirect_to edit_user_path(@user.id), notice: 'User was successfully updated.'
    else
        render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :interests,
        detail_attributes: [:avatar])
    end
end
