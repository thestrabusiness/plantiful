# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  attr_reader :current_user

  private

  def authenticate
    user = User.find_by(authentication_token: authentication_token)

    if authentication_token.present? && user.present?
      @current_user = user
      set_authentication_cookie(user.authentication_token)
    else
      reset_authentication_cooke
    end
  end

  def authentication_token
    request.headers["Authorization"]
  end

  def set_authentication_cookie(value)
    cookies[:authentication_token] = {
      value: value,
      secure: true,
      httponly: true
    }
  end

  def reset_authentication_cooke
    cookies.delete(:authentication_token)
  end
end
