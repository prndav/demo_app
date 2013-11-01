require 'spec_helper'

describe Answer do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create :question, user: user }
  before { @answer = question.answers.build(body: 'asdf', user_id: user.id) }

  subject { @answer }

  it { should respond_to(:body) }
  it { should respond_to(:user_id) }
  it { should respond_to(:question_id) }
  its(:user) { should eq user }
  its(:question) { should eq question }

  it { should be_valid }

  it { should belong_to(:user) }
  it { should belong_to(:question) }
  it { should have_many(:comments) }

  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:question_id) }
  it { should ensure_length_of(:body).is_at_most(1000) }

end

