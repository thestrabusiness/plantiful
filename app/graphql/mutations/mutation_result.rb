# frozen_string_literal: true

module Mutations
  class MutationResult
    def self.call(data: {}, success: true, errors: [])
      data.merge(success: success, errors: errors)
    end
  end
end
