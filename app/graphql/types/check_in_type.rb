# frozen_string_literal: true

module Types
  class CheckInType < BaseObject
    field :id, ID, null: false
    field :watered, Boolean, null: false
    field :fertilized, Boolean, null: false
    field :performed_by, Types::UserType, null: false
    field :plant, Types::PlantType, null: false
    field :notes, String, null: true
  end
end
