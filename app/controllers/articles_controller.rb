class ArticlesController < ApplicationController

  def show
    store_location
    current_article = Article.find(params[:id])
    @comments = @article.comments.paginate(page: params[:page])
    @comment = Comment.new
  end

  def index
  end
end
