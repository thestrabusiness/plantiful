# frozen_string_literal: true

class Plant < ApplicationRecord
  FREQUENCY_UNITS = %w[day week].freeze

  belongs_to :garden
  belongs_to :added_by, class_name: "User"
  has_many :check_ins

  validates :name, presence: true
  validates :garden, presence: true
  validates :added_by, presence: true
  validates :check_frequency_scalar, presence: true, numericality: true
  validates :check_frequency_unit, presence: true, inclusion: FREQUENCY_UNITS

  def check_frequency
    check_frequency_scalar.public_send(check_frequency_unit)
  end
end

# == Schema Information
#
# Table name: plants
#
#  id                     :bigint           not null, primary key
#  check_frequency_scalar :integer          not null
#  check_frequency_unit   :string           not null
#  name                   :string           not null
#  notes                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  added_by_id            :bigint           not null
#  garden_id              :bigint           not null
#
# Indexes
#
#  index_plants_on_added_by_id  (added_by_id)
#  index_plants_on_garden_id    (garden_id)
#  index_plants_on_name         (name)
#
# Foreign Keys
#
#  fk_rails_...  (added_by_id => users.id)
#  fk_rails_...  (garden_id => gardens.id)
#
