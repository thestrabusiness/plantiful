# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::SignIn, description: "Sign a user in with email and password"
    field :sign_out, mutation: Mutations::SignOut, description: "Sign out the current user"
    field :create_garden, mutation: Mutations::CreateGarden, description: "Creates a new garden for the current user"
    field :create_plant, mutation: Mutations::CreatePlant, description: "Creates a new plant for the current user"
    field :create_check_in, mutation: Mutations::CreateCheckIn, description: "Add a check in for the given plant"
  end
end
