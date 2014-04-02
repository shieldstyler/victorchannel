require 'spec_helper'

describe "Article Pages" do

  subject { page }

  describe "Author" do

    let!(:author) {FactoryGirl.create(:author) }
    let(:article) {FactoryGirl.create(:article, author_id: 1) } #should have dynamic build

    before { visit article_path(article) }

    it { should have_content article.author.name }
    it { should have_content article.title }
    it { should have_title(full_title(article.title)) }
  end

  describe "Comments" do
    let!(:author) {FactoryGirl.create(:author) }
    let!(:article) {FactoryGirl.create(:article, author_id: 1) } #should have dynamic build
    let!(:user) {FactoryGirl.create(:user) }
    let(:c1) {FactoryGirl.create(:comment, article_id: 1, user_id: 1 ) } #should have dynamic build

    before { visit article_path(article) }

    it { should have_content(c1.content) }
    it { should have_content (article.title) }

  end
end





