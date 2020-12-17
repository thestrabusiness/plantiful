# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::CreatePlant do
  context "with a signed in user" do
    it "creates a plants" do
      garden = create(:garden)
      user = garden.owner

      variables = {
        name: "New plant",
        gardenId: garden.id.to_s,
        checkFrequencyUnit: "day",
        checkFrequencyScalar: 5,
        notes: "some notes"
      }

      result = gql_query(query: mutation, variables: variables, context: { current_user: user })
      data = result.fetch("data").fetch("createPlant")

      expect(Plant.count).to eq 1
      expect(data.dig("plant", "id")).to be_present
      expect(data.dig("plant", "name")).to eq variables[:name]
      expect(data.dig("plant", "checkFrequencyUnit")).to eq variables[:checkFrequencyUnit]
      expect(data.dig("plant", "checkFrequencyScalar")).to eq variables[:checkFrequencyScalar]
      expect(data.dig("plant", "notes")).to eq variables[:notes]
      expect(data.dig("plant", "addedBy", "id")).to eq user.id.to_s
    end

    context "who isn't a garden member" do
      it "returns an membership error" do
        garden = create(:garden)

        variables = {
          name: "New plant",
          gardenId: garden.id.to_s,
          checkFrequencyUnit: "day",
          checkFrequencyScalar: 5
        }

        result = gql_query(query: mutation, variables: variables, context: { current_user: create(:user) })

        expect(Plant.count).to eq 0
        expect(result.dig("errors", 0, "message")).to eq("User must be a garden member to add a plant")
        expect(result.dig("data", "createPlant")).to be_blank
      end
    end
  end

  context "without a signed in user" do
    it "returns an authentication error error" do
      garden = create(:garden)

      variables = {
        name: "New plant",
        gardenId: garden.id.to_s,
        checkFrequencyUnit: "day",
        checkFrequencyScalar: 5
      }

      result = gql_query(query: mutation, variables: variables)

      expect(Plant.count).to eq 0
      expect(result.dig("errors", 0, "message")).to eq("User must be signed in to create a plant")
      expect(result.dig("data", "createPlant")).to be_blank
    end
  end

  def mutation
    <<~GQL
      mutation createPlant(
        $name: String!,
        $checkFrequencyUnit: String!,
        $checkFrequencyScalar: Int!
        $gardenId: ID!
        $notes: String,
      ) {
        createPlant(input: { name: $name, checkFrequencyUnit: $checkFrequencyUnit, checkFrequencyScalar: $checkFrequencyScalar, gardenId: $gardenId, notes: $notes }) {
          plant {
            id
            name
            checkFrequencyUnit
            checkFrequencyScalar
            notes
            addedBy {
              id
            }
            garden {
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
