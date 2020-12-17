# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::SignOut do
  it "signs out the current user" do
    user = create(:user)
    original_token = user.authentication_token

    result = gql_query(query: mutation, context: { current_user: user })
    sign_out_data = result.fetch("data").fetch("signOut")
    user_data = sign_out_data.fetch("user")
    user.reload

    expect(user_data["id"]).to eq(user.id.to_s)
    expect(user_data["authenticationToken"]).to_not eq(original_token)
    expect(user.authentication_token).to_not eq(original_token)
    expect(sign_out_data.fetch("success")).to eq(true)
    expect(sign_out_data.fetch("errors")).to be_blank
  end

  it "raises error for user not signed in" do
    result = gql_query(query: mutation)
    sign_out_data = result.fetch("data").fetch("signOut")

    expect(result.dig("errors", 0, "message")).to eq("User not signed in")
    expect(sign_out_data).to be_blank
  end

  def mutation
    <<~GQL
      mutation signOut {
        signOut(input: {}) {
          user {
            id
            authenticationToken
          }
          success
          errors
        }
      }
    GQL
  end
end
