module ICIMS
  class GetRequest

    include Requestable

    def initialize url
      @url = url
    end

    def call
      request = get_request_object
      ICIMS.logger.info "#{request.method} #{uri.to_s}"
      response = ssl_connection.request(request)
      parsed_response = JSON.parse(response.body)
      ICIMS.logger.info parsed_response
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