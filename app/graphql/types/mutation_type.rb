# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::SignIn, description: "Sign a user in with email and password"
    field :sign_out, mutation: Mutations::SignOut, description: "Sign out the current user"
    field :create_garden, mutation: Mutations::CreateGarden, description: "Creates a new garden for the current user"
  end
end
