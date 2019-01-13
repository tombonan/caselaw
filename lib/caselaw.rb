require "caselaw/version"
require "caselaw/errors"
require "caselaw/request"
require "caselaw/client"
require "caselaw/jurisdiction"

module Caselaw
  class << self
    attr_accessor :settings
  end
  self.settings = {}

  def self.new(params = {})
    Caselaw::Client.new(params)
  end

  # Global configuration settings
  def self.configure(params = {})
    # fail(ArgumentError, "API key hash required.") unless params.is_a?(Hash)
    
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
