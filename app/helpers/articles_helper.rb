module ArticlesHelper

  def articles
    @articles = Article.all
  end
end
