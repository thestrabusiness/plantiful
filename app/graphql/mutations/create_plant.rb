# frozen_string_literal: true

module Mutations
  class CreatePlant < Mutations::BaseMutation
    argument :garden_id, ID, required: true
    argument :name, String, required: true
    argument :check_frequency_unit, String, required: true
    argument :check_frequency_scalar, Integer, required: true

    field :plant, Types::PlantType, null: false

    def resolve(args)
      user = context[:current_user]
      garden = Garden.find(args[:garden_id])

      if user.nil?
        GraphQL::ExecutionError.new("User must be signed in to create a plant")
      elsif garden.member?(user)
        plant = Plant.create(
          name: args[:name],
          garden: garden,
          added_by: user,
          check_frequency_unit: args[:check_frequency_unit],
          check_frequency_scalar: args[:check_frequency_scalar]
        )

        MutationResult.call(
          data: { plant: plant },
          success: plant.valid?,
          errors: plant.errors
        )
      else
        GraphQL::ExecutionError.new("User must be a garden member to add a plant")
      end
    end
  end
end
