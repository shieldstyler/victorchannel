class CommentsController < ApplicationController
  before_action :signed_in_user

  def create
    @article = Article.find_by_id(2)
    @comment = Comment.new(content: comment_params[:content], article_id: @article.id, user: current_user)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_back_or(root_path)
   else
      render 'static_pages/home'
    end
  end

  def index
    @comments = Comment.paginate(page: params[:page])
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end