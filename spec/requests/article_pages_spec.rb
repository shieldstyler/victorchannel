require 'spec_helper'

describe "Article Pages" do

  subject { page }


  let!(:author) {FactoryGirl.create(:author) }
  let!(:article) {FactoryGirl.create(:article, author: author ) } #should have dynamic build
  let!(:user) {FactoryGirl.create(:user) }
  let(:c1) {FactoryGirl.create(:comment, user: user, article: article ) } #should have dynamic build

  before { visit article_path(article) }

  it { should have_content article.author.name }
  it { should have_content article.title }
  it { should have_title(full_title(article.title)) }

  describe "Comments" do

    it { should have_content (c1.content) }
    it { should have_content (article.title) }
    it { should have_content "Comments" }
    end
end
