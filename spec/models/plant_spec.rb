# frozen_string_literal: true

require "rails_helper"

RSpec.describe Plant do
  describe "validations" do
    it { should validate_presence_of(:check_frequency_scalar) }
    it { should validate_numericality_of(:check_frequency_scalar) }
    it { should validate_presence_of(:check_frequency_unit) }
    it { should validate_inclusion_of(:check_frequency_unit).in_array Plant::FREQUENCY_UNITS }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:garden) }
    it { should validate_presence_of(:added_by) }
  end

  describe "assocations" do
    it { should have_many :check_ins }
    it { should belong_to :garden }
    it { should belong_to :added_by }
  end

  describe "scopes" do
    describe ".active" do
      it "returns plants where deleted_at is nil" do
        deleted = create(:plant, deleted: true)
        active = create(:plant, deleted: false)

        result = Plant.active

        expect(result).to include active
        expect(result).to_not include deleted
      end
    end

    describe ".deleted" do
      it "returns plants where deleted_at is not nil and in the past" do
        deleted_in_past = create(:plant, deleted_at: 1.day.ago)
        deleted_in_future = create(:plant, deleted_at: 1.day.from_now)
        not_deleted = create(:plant, deleted: false)

        result = Plant.deleted

        expect(result).to include deleted_in_past
        expect(result).to_not include deleted_in_future
        expect(result).to_not include not_deleted
      end
    end
  end

  describe "#check_frequency" do
    it "returns a duration" do
      plant = build(:plant, check_frequency_unit: "day", check_frequency_scalar: 5)

      expect(plant.check_frequency).to eq 5.days
    end
  end
end
