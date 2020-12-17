module Mutations
  class CreateCheckIn < Mutations::BaseMutation
    argument :plant_id, ID, required: true
    argument :watered, Boolean, required: true
    argument :fertilized, Boolean, required: true
    argument :notes, String, required: false

    field :check_in, Types::CheckInType, null: false

    def resolve(args)
      user = context[:current_user]
      plant = Plant.find(args[:plant_id])

      if user.nil?
        GraphQL::ExecutionError.new("User must be signed in to add a check in")
      elsif plant.garden.member?(user)
        check_in = plant.check_ins.create(
          watered: args[:watered],
          fertilized: args[:fertilized],
          notes: args[:notes],
          performed_by: user
        )

        MutationResult.call(
          data: { check_in: check_in },
          success: check_in.valid?,
          errors: check_in.errors
        )
      else
        GraphQL::ExecutionError.new("User must be a garden member to add a check in")
      end
    end
  end
end
