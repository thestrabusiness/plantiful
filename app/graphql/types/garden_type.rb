# frozen_string_literal: true

module Types
  class GardenType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :owner, Types::UserType, null: false
    field :users, [Types::UserType], null: false
  end
end
