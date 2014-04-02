require 'spec_helper'

describe Author do

  let(:author) { FactoryGirl.create(:author) }
  before { @author = author }

  subject { @author }

  it { should respond_to(:name) }
  it { should be_valid }

  describe "when name is not present" do
    before { @author.name = nil }
    it { should_not be_valid }
  end
end