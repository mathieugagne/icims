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
  mattr_accessor :portal_ids

  def self.setup
    yield self
  end

  def self.logger
    @logger ||= begin
      log_file = defined?(Rails) ? [Rails.root, 'log', 'icims.log'].join('/') : 'icims.log'
      Logger.new(log_file)
    end
  end

end