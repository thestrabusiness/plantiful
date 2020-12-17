# frozen_string_literal: true

FactoryBot.define do
  factory :check_in do
    watered { false }
    fertilized { false }
    plant
  end

  factory :plant do
    sequence(:name) { |n| "Plant #{n}" }
    check_frequency_unit { "day" }
    check_frequency_scalar { 3 }
  end
end
