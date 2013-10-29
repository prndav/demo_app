require 'spec_helper'

describe Comment do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create :question, user: user }
  let(:answer) { FactoryGirl.create :answer, user: user, question: question }
  before { @comment = answer.comments.build(body: 'asdf', user_id: user.id, answer_id: answer.id) }

  subject { @comment }

  it { should respond_to(:body) }
  it { should respond_to(:user_id) }
  it { should respond_to(:answer_id) }
  it { should respond_to(:answer) }
  it { should respond_to(:replies) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  its(:answer) { should eq answer }
  it { should be_valid }

  describe 'with blank content' do
    before { @comment.body = ' ' }
    it { should_not be_valid }
  end

  describe 'when user_id is not present' do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end

  describe 'when answer_id is not present' do
    before { @comment.answer_id = nil }
    it { should_not be_valid }
  end

  describe 'when content is too long' do
    before { @comment.body = 'a' * 1001 }
    it { should_not be_valid }
  end
end
