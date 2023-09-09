# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    sequence(:email) do |n|
      "#{n}-#{FFaker::Internet.email}"
    end

    password { '123456' }
  end
end
