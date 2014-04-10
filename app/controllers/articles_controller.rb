class ArticlesController < ApplicationController

  def show
    store_location
    @article = Article.friendly.find(params[:id])
    @comments = @article.comments.paginate(page: params[:page])
    @comment = Comment.new
  end

  def index
  end
end
