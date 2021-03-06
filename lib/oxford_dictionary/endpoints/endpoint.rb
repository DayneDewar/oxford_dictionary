require 'oxford_dictionary/deserialize'

module OxfordDictionary
  module Endpoints
    # The common functionality (and dependency initialization) of all endpoints
    #
    #
    # API documentation can be found here:
    # https://developer.oxforddictionaries.com/documentation
    class Endpoint
      def initialize(request_client:)
        @request_client = request_client
      end

      private

      def deserialize
        @deserialize ||= OxfordDictionary::Deserialize.new
      end

      def request_uri(path:, params:)
        URI(path).tap do |uri|
          uri.query = URI.encode_www_form(params) unless params.empty?
        end
      end
    end
  end
end
