# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  attr_reader :current_user

  private

  def authenticate
    user = User.find_by(authentication_token: authentication_token)

    if authentication_token.present? && user.present?
      @current_user = user
    end
  end

  def authentication_token
    request.headers["Authorization"]
  end
end
