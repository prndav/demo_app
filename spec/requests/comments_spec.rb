require 'spec_helper'

describe 'Comments' do

  before(:each) do
    user = FactoryGirl.create :user
    question = FactoryGirl.create :question, user: user
    answer = FactoryGirl.create :answer, user: user, question: question

    visit new_user_session_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button('Sign in')

    visit "/questions/#{question.id}"
    click_link('leave comment')
  end

  describe 'creation' do

    describe 'failure' do
      it 'should not make a new comment', js: true do
        lambda do
          click_button('Create Comment')
          page.should have_content('Your comment was not submitted')
        end.should_not change(Comment, :count)
      end
    end

    describe 'success' do
      it 'should make a new comment', js: true do
        content = 'Lorem ipsum dolor sit amet'
        lambda do
          fill_in :comment_body,  with: content
          click_button('Create Comment')
          page.should have_content('Your comment was submitted')
        end.should change(Comment, :count).by(1)
      end
    end

  end
end
