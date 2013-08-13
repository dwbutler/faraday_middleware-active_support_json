require 'faraday_middleware/response_middleware'
require 'faraday_middleware/request/encode_json'

module FaradayMiddleware
  module ActiveSupport
    class ParseJson < FaradayMiddleware::ResponseMiddleware
      dependency 'active_support/json'

      def parse(body)
        ::ActiveSupport::JSON.decode(body, @options) rescue body
      end
    end

    class EncodeJson < FaradayMiddleware::EncodeJson
      dependency 'active_support/json'

      def initialize(app, *)
        super(app)
      end

      def encode(data)
        ::ActiveSupport::JSON.encode(data)
      end
    end
  end
end

Faraday.register_middleware :response, :active_support_json => FaradayMiddleware::ActiveSupport::ParseJson
Faraday.register_middleware :request, :active_support_json => FaradayMiddleware::ActiveSupport::EncodeJson
