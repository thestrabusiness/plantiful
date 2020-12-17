# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
  end

  describe "associations" do
    it { should have_many(:plants).through(:gardens) }
    it { should have_many(:check_ins).through(:plants) }
    it { should have_many(:owned_gardens) }
    it { should have_and_belong_to_many(:gardens) }
  end
end
