# frozen_string_literal: true

FactoryBot.define do
  factory :question, class: Question do
    title { 'What is Ruby?' }
    body { 'What is Ruby and Ruby on Rails?' }

    association :user
  end
end
