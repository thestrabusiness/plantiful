# frozen_string_literal: true

require "rails_helper"

RSpec.describe CheckIn do
  describe "validations" do
    it { should validate_presence_of :plant }
  end

  describe "associations" do
    it { should belong_to :plant }
  end

  describe ".checked" do
    it "returns check ins where the plant was neither watered nor fertilized" do
      checked = create(:check_in, watered: false, fertilized: false)
      _fertilized = create(:check_in, fertilized: true)
      _watered = create(:check_in, watered: true)

      expect(CheckIn.checked).to match_array [checked]
    end
  end

  describe ".fertilized" do
    it "returns checkins where fertilized is true" do
      fertilized = create(:check_in, fertilized: true)
      _watered = create(:check_in, watered: true)
      _checked = create(:check_in, watered: false, fertilized: false)

      expect(CheckIn.fertilized).to match_array [fertilized]
    end
  end

  describe ".watered" do
    it "returns checkins where fertilized is true" do
      watered = create(:check_in, watered: true)
      _fertilized = create(:check_in, fertilized: true)
      _checked = create(:check_in, watered: false, fertilized: false)

      expect(CheckIn.watered).to match_array [watered]
    end
  end
end
