# frozen_string_literal: true

require "rails_helper"

RSpec.describe Garden do
  describe "validations" do
    it { should validate_presence_of :owner }
    it { should validate_presence_of :name }
  end

  describe "associations" do
    it { should belong_to :owner }
    it { should have_and_belong_to_many :users }
    it { should have_many :plants }
  end

  describe "#member?" do
    context "when the given user is the owner" do
      it "returns true" do
        garden = create(:garden)
        user = garden.owner

        expect(garden.member?(user)).to be true
      end
    end

    context "when the given user is a member" do
      it "returns true" do
        garden = create(:garden)
        user = create(:user)
        garden.users << user

        expect(garden.member?(user)).to be true
      end
    end

    context "when the given user is neither a member or owner" do
      it "returns false" do
        garden = create(:garden)
        user = create(:user)

        expect(garden.member?(user)).to be false
      end
    end
  end
end
