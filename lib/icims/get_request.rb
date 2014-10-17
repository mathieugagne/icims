module ICIMS
  class GetRequest

    include Requestable

    def initialize url
      @url = url
    end

    def call
      request = get_request_object
      Rails.logger.info "#{request.method} #{uri.to_s}" if defined?(Rails)
      response = ssl_connection.request(request)
      parsed_response = JSON.parse(response.body)
      Rails.logger.info parsed_response if defined?(Rails)
      parsed_response
    end

    class << self

      def perform(url)
        new(url).call
      end

    end

    private

    def uri
      URI.parse(customer_url + @url)
    end

    def ssl_connection
      connection = Net::HTTP.new(uri.host, uri.port)
      connection.use_ssl = true
      connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
      connection
    end

    def get_request_object
      request_object = Net::HTTP::Get.new(uri.request_uri)
      request_object.basic_auth(ICIMS.username, ICIMS.password)
      request_object
    end

  end
end