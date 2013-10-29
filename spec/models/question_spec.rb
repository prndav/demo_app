require 'spec_helper'

describe Question do
  let(:user) { FactoryGirl.create(:user) }
  before { @question = user.questions.build(title: 'asdf', body: 'asdf') }

  subject { @question }

  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:user_id) }
  it { should respond_to(:answers) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe 'when user_id is not present' do
    before { @question.user_id = nil }
    it { should_not be_valid }
  end

  describe 'with blank content' do
    before { @question.body = ' ' }
    it { should_not be_valid }
  end

  describe 'with blank title' do
    before { @question.title = ' ' }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @question.body = 'a' * 1001 }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @question.title = 'a' * 101 }
    it { should_not be_valid }
  end

end

