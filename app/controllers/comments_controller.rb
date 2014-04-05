class CommentsController < ApplicationController
  before_action :signed_in_user

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article = @article
    @comment.user = current_user
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
    params.require(:comment).permit(:content, :article_id, :user_id)
  end
end



#@comment = Comment.new(content: comment_params[:content], article_id: current_article.id, user: current_user)