require 'rails_helper'

RSpec.describe ICIMS::JobParser do

  let(:get_response)  {"{\"id\":1023,\"folder\":{\"id\":\"D31001\",\"value\":\"Approved\",\"formattedvalue\":\"Approved\"},\"jobtitle\":\"Accounting Intern\",\"overview\":\"Very long description that we truncated\",\"positioncategory\":{\"id\":\"C8713\",\"soccode\":\"0\",\"value\":\"Accounting/Finance\",\"formattedvalue\":\"Accounting/Finance\"},\"positiontype\":{\"formattedvalue\":\"New\"},\"joblocation\":{\"id\":5,\"companyid\":6,\"address\":\"https://api.icims.com/customers/4560/companies/6/fields/addresses/5\",\"value\":\"Chicago - 540 W. Madison Street Suite 2500 Chicago, Illinois 60661 United States \"},\"links\":[{\"title\":\"The current profile being viewed.\",\"rel\":\"self\",\"url\":\"https://api.icims.com/customers/4560/jobs/1023\"}]}"}

  include ICIMSHelper
  before(:each) do
    stub_icims_request(get_response)
  end

  before :each do
    @job = ICIMS::Job.find('1023')
    @parser = ICIMS::JobOfferParser.new(@job)
  end

  it 'parses title' do
    expect(@parser.title).to eq 'Accounting Intern'
  end

  it 'parses category' do
    expect(@parser.category).to eq 'Accounting/Finance'
  end

  it 'parses locations' do
    expect(@parser.locations).to eq ['Chicago']
  end

  it 'parses approved' do
    expect(@parser.approved).to be true
  end

  it 'parses hire_type' do
    expect(@parser.hire_type).to eq 'New'
  end

  it 'parses description' do
    expect(@parser.description).to eq 'Very long description that we truncated'
  end

end
