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
  it { should respond_to(:parent_id) }
  its(:user) { should eq user }
  its(:answer) { should eq answer }

  it { should be_valid }

  it { should belong_to(:user) }
  it { should belong_to(:answer) }

  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:answer_id) }
  it { should ensure_length_of(:body).is_at_most(1000) }

end
