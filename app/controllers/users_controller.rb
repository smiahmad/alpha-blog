class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    #debugger
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:notice] = "Your account information was successfully updated"
        format.html { redirect_to @user }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Welcome to Alpha Blog #{@user.username}. You have successfully signed up!"
        format.html { redirect_to articles_path, status: :see_other }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    #make sure to set the current user to nil in the session otherwise application will throw an error
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and all articles successfully deleted"
    redirect_to articles_path, status: :see_other
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own user details"
      redirect_to current_user, status: :see_other
    end
  end

end
