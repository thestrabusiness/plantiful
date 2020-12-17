# frozen_string_literal: true

class CheckIn < ApplicationRecord
  belongs_to :plant

  validates :plant, presence: true

  scope :checked, -> { where(fertilized: false, watered: false) }
  scope :fertilized, -> { where(fertilized: true) }
  scope :watered, -> { where(watered: true) }
end
