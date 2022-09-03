class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show
    #debugger
  end

  def index
    #debugger
    @articles = Article.all
  end

  def new
    #debugger
    @article = Article.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        # format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        flash[:notice] = "Article saved successfully"
        format.html { redirect_to article_url(@article) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end

    # following did not work for error case!!!
    # if @article.save
    #   redirect_to @article
    # else
    #   render 'new'
    # end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
