# frozen_string_literal: true

class Garden < ApplicationRecord
  has_many :plants

  validates :name, presence: true
end

# == Schema Information
#
# Table name: gardens
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_gardens_on_name  (name)
#
