require "caselaw/version"
require "caselaw/client"
require "caselaw/request"

module Caselaw
  class << self
    attr_accessor :settings
  end
  self.settings = {}

  def self.new(params = {})
    Caselaw::Client.new(params)
  end

  def self.configure(params = {})
    settings[:api_key] = params[:api_key]
    settings
  end

  # Return global config hash
  def self.configuration
    settings
  end

  # Resets the global configuration
  def self.reset_configuration
    self.settings = {}
  end

end
