require 'faraday_middleware/response_middleware'
require 'faraday_middleware/request/encode_json'

module FaradayMiddleware
  module ActiveSupport
    class ParseJson < FaradayMiddleware::ResponseMiddleware
      dependency 'active_support/version'
      dependency 'active_support/json'

      if ::ActiveSupport::VERSION::MAJOR < 4
        def parse(body)
          ::ActiveSupport::JSON.decode(body, @options) rescue body
        end
      else
        def parse(body)
          ::ActiveSupport::JSON.decode(body) rescue body
        end
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

Faraday::Response.register_middleware :active_support_json => FaradayMiddleware::ActiveSupport::ParseJson
Faraday::Request.register_middleware :active_support_json => FaradayMiddleware::ActiveSupport::EncodeJson
