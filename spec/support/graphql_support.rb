# frozen_string_literal: true

module GraphqlSupport
  def gql_query(query:, user: nil, variables: {}, context: {})
    context[:current_user] ||= user

    query = GraphQL::Query.new(
      PlantifulSchema,
      query,
      variables: variables.deep_stringify_keys,
      context: context
    )

    query.result.to_h
  end
end

RSpec.configure do |config|
  config.include GraphqlSupport, type: :gql
end
