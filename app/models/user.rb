# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  has_and_belongs_to_many :gardens
  has_many :owned_gardens, foreign_key: :owner_id, class_name: "Garden"
  has_many :plants, through: :gardens
  has_many :check_ins, through: :plants

  validates :first_name, :last_name, presence: true
end

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  confirmation_token :string(128)
#  email              :string
#  encrypted_password :string(128)
#  first_name         :string           not null
#  last_name          :string           not null
#  remember_token     :string(128)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email           (email)
#  index_users_on_remember_token  (remember_token)
#
