class PagesController < ApplicationController
  def home
    redirect_to articles_path, status: :see_other if logged_in?
  end

  def about
  end
end
