module ICIMS
  module Requestable

    private

    def customer_url
      raise ArgumentError, "You must provide a `customer_id`. e.g. ICIMS.customer_id = 1234" unless ICIMS.customer_id.present?
      "https://api.icims.com/customers/#{ICIMS.customer_id}"
    end

  end
end