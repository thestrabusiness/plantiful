# frozen_string_literal: true

FactoryBot.define do
  factory :check_in do
    watered { false }
    fertilized { false }
    plant
    performed_by { create(:user) }
  end

  factory :plant do
    sequence(:name) { |n| "Plant #{n}" }
    check_frequency_unit { "day" }
    check_frequency_scalar { 3 }
    garden
    added_by { create(:user) }
  end

  factory :garden do
    sequence(:name) { |n| "Garden #{n}" }
    owner { create(:user) }
  end

  factory :user do
    sequence(:first_name) { |n| "User #{n}" }
    sequence(:email) { |n| "plantiful#{n}@exmaple.com" }
    password { "password" }
    last_name { "Last" }
  end
end
