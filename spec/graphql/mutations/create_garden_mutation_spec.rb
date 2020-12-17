# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::CreateGarden do
  context "with a signed in user" do
    it "creates a garden" do
      user = create(:user)
      variables = { name: "New Garden" }

      result = gql_query(query: mutation, variables: variables, context: { current_user: user })
      data = result.fetch("data").fetch("createGarden")

      expect(Garden.count).to eq 1
      expect(data.dig("garden", "id")).to be_present
      expect(data.dig("garden", "name")).to eq variables[:name]
      expect(data.dig("garden", "owner", "id")).to eq user.id.to_s
    end
  end

  context "without a signed in user" do
    it "returns an authentication error error" do
      variables = { name: "New garden" }

      result = gql_query(query: mutation, variables: variables)

      expect(result.dig("errors", 0, "message")).to eq("User might be signed in to create a garden")
      expect(result.dig("data", "createGarden")).to be_blank
    end
  end

  def mutation
    <<~GQL
      mutation createGarden($name: String!) {
        createGarden(input: { name: $name }) {
          garden {
            id
            name
            owner {
              id
            }
          }
          success
          errors
        }
      }
    GQL
  end
end
