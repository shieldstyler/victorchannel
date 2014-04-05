module ArticlesHelper
  def current_article
    @article ||= Article.find(params[:id]))
  end
end
