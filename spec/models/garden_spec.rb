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
end
