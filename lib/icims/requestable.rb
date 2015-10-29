module ICIMS
  module Requestable

    private

    def customer_url
      ICIMS.base_url + ICIMS.customer_id
    end

  end
end
