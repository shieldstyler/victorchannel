class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.paginate(page: params[:page])
  end

end
