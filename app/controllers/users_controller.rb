class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        flash[:notice] = "Your account information was successfully updated"
        format.html { redirect_to articles_url }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash[:notice] = "Welcome to Alpha Blog #{@user.username}. You have successfully signed up!"
        format.html { redirect_to article_url(@user) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
