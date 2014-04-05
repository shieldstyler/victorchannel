require 'spec_helper'

describe Comment do

  let(:user) { FactoryGirl.create(:user) }
  before { @comment = user.comments.build(content: "loremipsum", article_id: 1) }

  subject { @comment }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:article_id) }
  it { should respond_to(:user) }
  its (:user) {should eq user}

  it { should be_valid }

  describe "when user_id is not present" do
    before { @comment.user_id = nil }
    it { should_not be_valid}
  end

  describe "with blank content" do
    before { @comment.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @comment.content = "a" * 201 }
    it { should_not be_valid }
  end
end