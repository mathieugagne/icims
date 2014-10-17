require 'icims/requestable'
require 'icims/get_request'
require 'icims/search_request'
require 'icims/job'

module ICIMS
  require 'net/https'
  require 'uri'
  require 'openssl'
  require 'json'
  require 'httparty'
  require 'active_support/all'

  mattr_accessor :username
  mattr_accessor :password
  mattr_accessor :customer_id

  def self.setup
    yield self
  end

end