module ICIMS
  module Requestable

    BASE_URL = "https://api.icims.com/customers/"

    private

    def customer_url
      BASE_URL + ICIMS.customer_id
    end

  end
end