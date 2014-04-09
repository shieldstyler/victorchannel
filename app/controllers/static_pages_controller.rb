class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
  end

  def legal
  end

  def contact
  end

  def help
  end

  def about
  end
end
