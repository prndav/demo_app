require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  @user_attr = FactoryGirl.attributes_for(:user)

  subject { user }

  it { should respond_to(:user_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  it { should have_many(:questions) }
  it { should have_many(:answers) }
  it { should have_many(:comments) }

end
