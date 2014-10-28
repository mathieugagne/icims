module ICIMS
  class SearchRequest

    include Requestable

    def initialize endpoint, filters
      @body = filters.to_json
      @url = customer_url + "/search/#{endpoint}"
    end

    def call
      ICIMS.logger.info "POST #{@url} #{@body}"
      response = post_request
      ICIMS.logger.info response
      if response['errors'].present?
        raise Net::HTTPBadResponse, response['errors']
      end
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