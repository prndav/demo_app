require 'spec_helper'
include Devise::TestHelpers

describe AnswersController do
  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  describe 'create a new answer' do

    it 'should redirect to question with a notice on successfull save' do
      post 'create', answer: FactoryGirl.attributes_for(:answer)
      flash[:success].should_not be_nil
      response.should redirect_to
    end

    it 'should re-render index on failed save' do
      # post :create, question: FactoryGirl.attributes_for(:invalid_question)
      # response.should render_template :index
    end



  end
end
