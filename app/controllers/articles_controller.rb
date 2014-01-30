class ArticlesController < ApplicationController
  before_action :get_author

  def index
    @articles = Article.all.order(updated_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @author.articles << Article.create!(article_params)
    redirect_to author_path(@author.id)
  end

  def edit
  end

  def update
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :id, :author_id)
  end

  def get_author
    @author = Author.find(params[:author_id]) if params.key?(:author_id)
  end

end
