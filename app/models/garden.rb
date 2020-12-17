# frozen_string_literal: true

class Garden < ApplicationRecord
  has_many :plants

  validates :name, presence: true
end
