module ICIMS
  class SearchRequest

    include Requestable

    def initialize endpoint, filters
      @body = filters.to_json
      @url = customer_url + "/search/#{endpoint}"
    end

    def call
      Rails.logger.info "POST #{@url} #{@body}" if defined?(Rails)
      response = post_request
      Rails.logger.info response if defined?(Rails)
      raise Net::HTTPBadResponse, response['errors'] if response['errors'].present?
      response
    end

    class << self
      def perform(endpoint, filters)
        new(endpoint, filters).call
      end
    end

    private

    def post_request
      HTTParty.post(@url, body: @body, verify: false, basic_auth: {username: ICIMS.username, password: ICIMS.password}, headers: {'Content-Type' => 'application/json'})
    end

  end
end