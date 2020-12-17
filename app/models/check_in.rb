# frozen_string_literal: true

class CheckIn < ApplicationRecord
  belongs_to :plant

  validates :plant, presence: true

  scope :checked, -> { where(fertilized: false, watered: false) }
  scope :fertilized, -> { where(fertilized: true) }
  scope :watered, -> { where(watered: true) }
end

# == Schema Information
#
# Table name: check_ins
#
#  id         :bigint           not null, primary key
#  fertilized :boolean          default(FALSE), not null
#  watered    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  plant_id   :bigint           not null
#
# Indexes
#
#  index_check_ins_on_plant_id  (plant_id)
#
# Foreign Keys
#
#  fk_rails_...  (plant_id => plants.id)
#
