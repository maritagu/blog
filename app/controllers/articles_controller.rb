class ArticlesController < ApplicationController

  def index
    @articles=Article.order("id DESC")
  end

  def new
    @article=Article.new
  end

  def show
    @article=Article.find(params[:id])
  end

  def edit
    @article=Article.find(params[:id])
  end

  def update
      article = Article.find(params[:id])
      if article.user_id == current_user.id
        article.update(article_params)
      end
      redirect_to '/articles'
  end

  def destroy
    article=Article.find(params[:id])
    article.destroy if current_user.id==article.user_id
    redirect_to '/articles'
  end

  def create
    Article.create(text:article_params[:text],title:article_params[:title],user_id:current_user.id)
    redirect_to '/articles'
  end

  private
  def article_params
    params.require(:article).permit(:title,:text)
  end

end
