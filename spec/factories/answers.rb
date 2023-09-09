# frozen_string_literal: true

FactoryBot.define do
  factory :answer, class: Answer do
    body { 'This is the answer' }

    association :question
    association :user
  end
end
