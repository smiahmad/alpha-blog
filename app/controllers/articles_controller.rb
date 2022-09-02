class ArticlesController < ApplicationController
  def show
    #debugger
    @article = Article.find(params[:id])
  end

  def index
    #debugger
    @articles = Article.all
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    redirect_to @article
  end

  def new

  end


end
