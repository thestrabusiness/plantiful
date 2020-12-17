# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :email, String, null: false
    field :authentication_token, String, null: false

    def authentication_token
      if object.id != context[:current_user]&.id
        raise GraphQL::UnauthorizedFieldError, "You can only access authentication_token for the signed in user"
      end

      object.authentication_token
    end
  end
end
