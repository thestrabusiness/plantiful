# frozen_string_literal: true

module Mutations
  class SignIn < Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: false

    def resolve(args)
      user = User.find_by(email: args[:email])

      if user.present? && user.authenticate(args[:password])
        context[:current_user] = user
        MutationResult.call(data: { user: user }, success: true)
      else
        GraphQL::ExecutionError.new("Incorrect Email/Password")
      end
    end
  end
end
