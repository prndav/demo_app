require 'spec_helper'

describe Answer do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create :question, user: user }
  before { @answer = question.answers.build(body: 'asdf', user_id: user.id) }

  subject { @answer }

  it { should respond_to(:body) }
  it { should respond_to(:user_id) }
  it { should respond_to(:question_id) }
  it { should respond_to(:question) }
  it { should respond_to(:comments) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  its(:question) { should eq question }
  it { should be_valid }

  describe 'with blank content' do
    before { @answer.body = ' ' }
    it { should_not be_valid }
  end

  describe 'when user_id is not present' do
    before { @answer.user_id = nil }
    it { should_not be_valid }
  end

  describe 'when question_id is not present' do
    before { @answer.question_id = nil }
    it { should_not be_valid }
  end

  describe 'when content is too long' do
    before { @answer.body = 'a' * 1001 }
    it { should_not be_valid }
  end
end

