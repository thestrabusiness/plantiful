# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::CreateCheckIn do
  context "with a signed in user" do
    it "creates a check in" do
      plant = create(:plant)

      variables = {
        notes: "Some notes",
        watered: true,
        fertilized: true,
        plantId: plant.id.to_s
      }

      result = gql_query(query: mutation, variables: variables, context: { current_user: plant.added_by })
      data = result.fetch("data").fetch("createCheckIn")

      expect(CheckIn.count).to eq 1
      expect(data.dig("checkIn", "id")).to be_present
      expect(data.dig("checkIn", "notes")).to eq variables[:notes]
      expect(data.dig("checkIn", "watered")).to eq variables[:watered]
      expect(data.dig("checkIn", "fertilized")).to eq variables[:fertilized]
      expect(data.dig("checkIn", "performedBy", "id")).to eq plant.added_by_id.to_s
      expect(data.dig("checkIn", "plant", "id")).to eq plant.id.to_s
    end

    context "who isn't a garden member" do
      it "returns an membership error" do
        plant = create(:plant)

        variables = {
          notes: "Some notes",
          watered: true,
          fertilized: true,
          plantId: plant.id.to_s
        }

        result = gql_query(query: mutation, variables: variables, context: { current_user: create(:user) })
        data = result.fetch("data")

        expect(CheckIn.count).to eq 0
        expect(result.dig("errors", 0, "message")).to eq("User must be a garden member to add a check in")
        expect(result.dig("data", "createCheckIn")).to be_blank
      end
    end
  end

  context "without a signed in user" do
    it "returns an authentication error error" do
      plant = create(:plant)

      variables = {
        notes: "Some notes",
        watered: true,
        fertilized: true,
        plantId: plant.id.to_s
      }

      result = gql_query(query: mutation, variables: variables)

      expect(CheckIn.count).to eq 0
      expect(result.dig("errors", 0, "message")).to eq("User must be signed in to add a check in")
      expect(result.dig("data", "createCheckIn")).to be_blank
    end
  end

  def mutation
    <<~GQL
      mutation createCheckIn(
        $watered: Boolean!,
        $fertilized: Boolean!
        $plantId: ID!
        $notes: String,
      ) {
        createCheckIn(input: { watered: $watered, fertilized: $fertilized, plantId: $plantId, notes: $notes }) {
          checkIn {
            id
            notes
            watered
            fertilized
            performedBy {
              id
            }
            plant {
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
