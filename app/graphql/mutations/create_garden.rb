# frozen_string_literal: true

module Mutations
  class CreateGarden < Mutations::BaseMutation
    argument :name, String, required: true

    field :garden, Types::GardenType, null: false

    def resolve(args)
      user = context[:current_user]

      if user.present?
        garden = Garden.create(name: args[:name], owner: user)

        MutationResult.call(
          data: { garden: garden },
          success: garden.valid?,
          errors: garden.errors
        )
      else
        GraphQL::ExecutionError.new("User must be signed in to create a garden")
      end
    end
  end
end
