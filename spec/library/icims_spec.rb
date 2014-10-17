require 'spec_helper'

describe ICIMS do

  it 'has a username' do
    expect(ICIMS).to respond_to(:username)
    expect(ICIMS).to respond_to(:username=)
  end

  it 'has a password' do
    expect(ICIMS).to respond_to(:password)
    expect(ICIMS).to respond_to(:password=)
  end

  it 'has a costumer ID' do
    expect(ICIMS).to respond_to(:customer_id)
    expect(ICIMS).to respond_to(:customer_id=)
  end

  it 'has portal IDs' do
    expect(ICIMS).to respond_to(:portal_ids)
    expect(ICIMS).to respond_to(:portal_ids=)
  end

  it 'is configurable' do
    ICIMS.setup do |config|
      config.username = 'foo'
      config.password = 'bar'
      config.customer_id = 123
      config.portal_ids = [3]
    end
    expect(ICIMS.username).to eq 'foo'
    expect(ICIMS.password).to eq 'bar'
    expect(ICIMS.customer_id).to eq 123
    expect(ICIMS.portal_ids).to eq [3]
  end

end