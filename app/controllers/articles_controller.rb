class ArticlesController < ApplicationController
  before_action :get_author

  skip_before_action :authenticate_admin!, only: [:index]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @author.articles << Article.create!(article_params)
    redirect_to author_path(@author.id)
  end


  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(update_params)
    redirect_to author_path(@author.id)
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :id, :author_id)
  end

  def update_params
    params.require(:article).permit(:title, :body)
  end

  def get_author
    @author = Author.find(params[:author_id]) if params.key?(:author_id)
  end

end
