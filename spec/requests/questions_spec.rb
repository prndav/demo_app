require 'spec_helper'

describe 'Questions' do

  before(:each) do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button('Sign in')
  end

  describe 'creation' do

    describe 'failure' do
      it 'should not make a new question' do
        lambda do
          visit root_path
          click_button('Create Question')
        end.should_not change(Question, :count)
      end
    end

    describe 'success' do
      it 'should make a new question' do
        title = 'Lorem Ipsum'
        content = 'Lorem ipsum dolor sit amet'
        lambda do
          visit root_path
          fill_in :question_title, with: title
          fill_in :question_body,  with: content
          click_button('Create Question')
          page.should have_content(title)
        end.should change(Question, :count).by(1)
      end
    end
  end

end
