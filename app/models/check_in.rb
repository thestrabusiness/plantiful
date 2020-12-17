# frozen_string_literal: true

class CheckIn < ApplicationRecord
  belongs_to :plant
  belongs_to :performed_by, class_name: "User"

  validates :plant, presence: true
  validates :performed_by, presence: true

  scope :checked, -> { where(fertilized: false, watered: false) }
  scope :fertilized, -> { where(fertilized: true) }
  scope :watered, -> { where(watered: true) }
end

# == Schema Information
#
# Table name: check_ins
#
#  id              :bigint           not null, primary key
#  fertilized      :boolean          default(FALSE), not null
#  watered         :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  performed_by_id :bigint           not null
#  plant_id        :bigint           not null
#
# Indexes
#
#  index_check_ins_on_performed_by_id  (performed_by_id)
#  index_check_ins_on_plant_id         (plant_id)
#
# Foreign Keys
#
#  fk_rails_...  (performed_by_id => users.id)
#  fk_rails_...  (plant_id => plants.id)
#
