class ArticlesController < ApplicationController
  before_action :get_author

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @author.articles << Article.create!(article_params)
    redirect_to author_path(@author.id)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :author_id)
  end

  def get_author
    @author = Author.find(params[:author_id]) if params.key?(:author_id)
  end

end
