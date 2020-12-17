# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_and_belongs_to_many :gardens
  has_many :owned_gardens, foreign_key: :owner_id, class_name: "Garden"
  has_many :plants, through: :gardens
  has_many :check_ins, through: :plants

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end

# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  authentication_token :string(128)      not null
#  email                :string           not null
#  first_name           :string           not null
#  last_name            :string           not null
#  password_digest      :string(128)      not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token)
#  index_users_on_email                 (email)
#
