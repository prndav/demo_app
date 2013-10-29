FactoryGirl.define do
  factory :user do
    # sequence(:user_name)  { |n| "Person #{n}" }
    # sequence(:email) { |n| "person_#{n}@example.com"}
    user_name 'rpelyush'
    email 'rpelyush@gmail.com'
    password 'foobarfoo'
    password_confirmation 'foobarfoo'
  end

  factory :question do |question|
    question.association :user
    question.title 'Some title'
    question.body 'lorem ipsum'
  end

  factory :invalid_question do |invalid_question|
    invalid_question.association :user
    invalid_question.title ''
    invalid_question.body ''
  end

  factory :answer do |answer|
    answer.association :user
    answer.association :question
    answer.body 'lorem ipsum'
  end

  factory :comment do |comment|
    comment.association :user
    comment.association :answer
    comment.body 'lorem ipsum'
  end
end


