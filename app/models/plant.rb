# frozen_string_literal: true

class Plant < ApplicationRecord
  FREQUENCY_UNITS = %w[day week].freeze

  has_many :check_ins

  validates :name, presence: true
  validates :check_frequency_scalar, presence: true, numericality: true
  validates :check_frequency_unit, presence: true, inclusion: FREQUENCY_UNITS

  def check_frequency
    check_frequency_scalar.public_send(check_frequency_unit)
  end
end
