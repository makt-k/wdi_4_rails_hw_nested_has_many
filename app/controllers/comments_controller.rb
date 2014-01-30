class CommentsController < ApplicationController

  before_action :get_author, :get_article

  def new
    @comment = Comment.new
  end

  def create
    @article.comments << Comment.create!(comment_params)
    redirect_to author_article_path(@author.id, @article.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :id, :article_id)
  end

  def get_author
    @author = Author.find(params[:author_id]) if params.key?(:author_id)
  end

  def get_article
    @article = Article.find(params[:article_id]) if params.key?(:article_id)
  end

end


