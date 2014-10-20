module ICIMSHelper

  def stub_icims_request response
    stub_request(:get, /.*api\.icims\.com.*/).to_return(body: response, status: 200)
    allow(HTTParty).to receive(:post).and_return(
      {"searchResults"=>
        [{"id"=>1000, "self"=>"https://api.icims.com/customers/4560/jobs/1000"},
         {"id"=>1008, "self"=>"https://api.icims.com/customers/4560/jobs/1008"},
         {"id"=>1009, "self"=>"https://api.icims.com/customers/4560/jobs/1009"}]
      }
    )
    ICIMS.username = 'Foo'
    ICIMS.password = 'Foo'
    ICIMS.customer_id = '1460'
    ICIMS.portal_ids = ['1']
  end

end