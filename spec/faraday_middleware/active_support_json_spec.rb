require 'spec_helper'

describe FaradayMiddleware::ActiveSupport::ParseJson do
  let(:response) { {:a => 1, :b => 2} }
  let(:json) { ::ActiveSupport::JSON.encode(response) }

  def connection(options={})
    Faraday.new do |builder|
      builder.response :active_support_json, options
      builder.adapter :test do |stub|
        stub.get('/') do
          [200, {}, json]
        end
      end
    end
  end

  it 'should parse the response body' do
    connection.get('/').body.should == {'a'=>1, 'b'=>2}
  end

  if ::ActiveSupport::VERSION::MAJOR < 4
    it 'should delegate options given by builder' do
      connection(:symbolize_keys => true).get('/').body.should == response
    end
  end
end

describe FaradayMiddleware::ActiveSupport::EncodeJson do
  let(:request) { {:a => 1, :b => 2} }
  let(:json) { ::ActiveSupport::JSON.encode(request) }

  def connection
    Faraday.new do |builder|
      builder.request :active_support_json
      builder.adapter :test do |stub|
        stub.post('/update', json) do
          [200, {}, json]
        end
      end
    end
  end

  it 'should parse the request body' do
    resp = connection.post('/update', request)
    resp.body.should == json
  end
end
