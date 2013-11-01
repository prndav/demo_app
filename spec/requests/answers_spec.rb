require 'spec_helper'

describe 'Answers' do

  before(:each) do
    user = FactoryGirl.create(:user)
    @question = FactoryGirl.create :question, user: user
    visit new_user_session_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button('Sign in')
  end

  describe 'creation' do

    describe 'failure' do
      it 'should not make a new answer' do
        lambda do
          visit "/questions/#{@question.id}"
          click_button('Create Answer')
        end.should_not change(Answer, :count)
      end
    end

    describe 'success' do
      it 'should make a new question' do
        content = 'Lorem ipsum dolor sit amet'
        lambda do
          visit "/questions/#{@question.id}"
          fill_in :answer_body,  with: content
          click_button('Create Answer')
          page.should have_content(content)
        end.should change(Answer, :count).by(1)
      end
    end
  end

end
