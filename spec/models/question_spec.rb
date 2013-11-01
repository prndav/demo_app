require 'spec_helper'

describe Question do
  let(:user) { FactoryGirl.create(:user) }
  before { @question = user.questions.build(title: 'asdf', body: 'asdf') }

  subject { @question }

  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:user_id) }
  its(:user) { should eq user }

  it { should be_valid }

  it { should belong_to(:user) }
  it { should have_many(:answers) }

  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
  it { should ensure_length_of(:body).is_at_most(1000) }
  it { should ensure_length_of(:title).is_at_most(100) }

end

