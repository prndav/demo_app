require 'spec_helper'

describe 'Comments' do

  # before(:each) do
  #   user = FactoryGirl.create(:user)
  #   visit new_user_session_path
  #   fill_in :user_email, :with => user.email
  #   fill_in :user_password, :with => user.password
  #   click_button('Sign in')

  #   question = FactoryGirl.create :question, user: user
  #   @answer = FactoryGirl.create :answer, user: user, question: question
  #   visit "/questions/#{question.id}"
  #   click_link('leave comment')
  # end

  # describe 'creation' do

  #   describe 'failure' do
  #     it 'should not make a new comment' do
  #       lambda do
  #         click_button('Create Comment')
  #         page.should have_selector('div#error_explanation')
  #       end.should_not change(Comment, :count)
  #     end
  #   end

  #   describe 'success' do
  #     it 'should make a new comment' do
  #       content = 'Lorem ipsum dolor sit amet'
  #       lambda do
  #         fill_in :comment_body,  with: content
  #         click_button('Create Comment')
  #         page.should have_content(content)
  #       end.should change(Comment, :count).by(1)
  #     end
  #   end

  #   describe 'check' do
  #     it 'asdfadsf' do
  #       page.should have_content(@answer.body)
  #     end
  #   end
  # end
end
