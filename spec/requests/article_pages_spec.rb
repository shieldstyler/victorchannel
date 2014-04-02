require 'spec_helper'

describe "Article Pages" do


  subject { page }

  it "should have the correct article title" do
    let!(:author) { FactoryGirl.create(:author)}
    let!(:article) { FactoryGirl.create(:article, author: author, published: Date.yesterday, edited: Date.today) }

    before { visit article_path(article) }

    it { should have_content(article.title) }
    it { should have_content(author.name)}
  end
end
