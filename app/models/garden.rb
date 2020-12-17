# frozen_string_literal: true

class Garden < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_and_belongs_to_many :users
  has_many :plants

  validates :name, presence: true
  validates :owner, presence: true
end

# == Schema Information
#
# Table name: gardens
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint           not null
#
# Indexes
#
#  index_gardens_on_name      (name)
#  index_gardens_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
