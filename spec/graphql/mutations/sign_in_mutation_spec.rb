# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::SignIn do
  it "signs in the user" do
    user = create(:user)
    variables = {
      email: user.email,
      password: user.password
    }

    result = gql_query(query: mutation, variables: variables)
    data = result.fetch("data").fetch("signIn")

    expect(data.dig("user", "id")).to eq(user.id.to_s)
    expect(data.dig("user", "authenticationToken")).to eq(user.authentication_token)
    expect(data.dig("user", "firstName")).to eq(user.first_name)
    expect(data.dig("user", "lastName")).to eq(user.last_name)
    expect(data.dig("user", "email")).to eq(user.email)
    expect(data["success"]).to eq(true)
    expect(data["errors"]).to be_blank
  end

  it "raises error for incorrect email/password" do
    user = create(:user)
    variables = {
      email: user.email,
      password: "wrongpassword"
    }

    result = gql_query(query: mutation, variables: variables)
    expect(result.dig("errors", 0, "message")).to eq("Incorrect Email/Password")
    expect(result.dig("data", "signIn")).to be_blank
  end

  it "raises error for missing user" do
    variables = {
      email: "nobody@example.com",
      password: "whatever"
    }

    result = gql_query(query: mutation, variables: variables)

    expect(result.dig("errors", 0, "message")).to eq("Incorrect Email/Password")
    expect(result.dig("data", "signIn")).to be_blank
  end

  def mutation
    <<~GQL
      mutation signIn($email: String!, $password: String!) {
        signIn(input: { email: $email, password: $password }) {
          user {
            id
            firstName
            lastName
            authenticationToken
            email
          }
          success
          errors
        }
      }
    GQL
  end
end
