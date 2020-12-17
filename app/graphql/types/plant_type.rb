# frozen_string_literal: true

module Types
  class PlantType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :check_frequency_unit, String, null: false
    field :check_frequency_scalar, Integer, null: false
    field :added_by, Types::UserType, null: false
    field :garden, Types::GardenType, null: false
    field :notes, String, null: true
  end
end
