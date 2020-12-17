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

  describe "#check_frequency" do
    it "returns a duration" do
      plant = build(:plant, check_frequency_unit: "day", check_frequency_scalar: 5)

      expect(plant.check_frequency).to eq 5.days
    end
  end
end
