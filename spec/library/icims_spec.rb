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

  it 'is configurable' do
    ICIMS.setup do |config|
      config.username = 'foo'
      config.password = 'bar'
      config.customer_id = 123
    end
    expect(ICIMS.username).to eq 'foo'
    expect(ICIMS.password).to eq 'bar'
    expect(ICIMS.customer_id).to eq 123
  end

end