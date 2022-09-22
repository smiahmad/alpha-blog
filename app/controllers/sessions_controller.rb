class SessionsController < ApplicationController

  def new
  end

  def create
    #debugger
    user = User.find_by(email: params[:session][:email].downcase)

    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:notice] = "Logged in successfully"
        format.html { redirect_to user }
      else
        flash.now[:alert] = "There was something wrong with your login!"
        format.html { render :new, status: :unprocessable_entity }
      end

    end

  end

  def destroy
    #debugger
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path, status: :see_other
  end

end
