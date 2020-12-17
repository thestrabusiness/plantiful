# frozen_string_literal: true

class AuthenticationToken
  def self.new
    SecureRandom.hex(20).encode("UTF-8")
  end
end
