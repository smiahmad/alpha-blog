class UsersController < ApplicationController

  def new
    @user = User.new
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
