require 'spec_helper'

describe Article do

  let(:author) { FactoryGirl.create(:author) }
  before { @article = author.articles.build(title: "Article Title 1", published: Date.today, edited: Date.yesterday) }

  subject { @article }

  it { should respond_to(:title) }
  it { should respond_to(:author_id) }
  it { should respond_to(:author) }
  it { should respond_to(:published) }
  it { should respond_to(:edited) }
  its(:author) { should eq author }

  it { should be_valid }

  describe "when author_id is not present" do
    before { @article.author_id = nil }
    it { should_not be_valid }
  end
end