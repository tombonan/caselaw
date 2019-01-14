require "spec_helper"

RSpec.describe Caselaw::Client do
  let(:client)  { Caselaw::Client.new(api_key: "SECRET_KEY") }
  before(:each) { Caselaw.reset_configuration }
  
  describe "new" do
    it "requires a hash argument" do
      expect { Caselaw::Client.new("Tom") }
        .to raise_error(ArgumentError, "API key hash is required.")
    end
  end    
    
end
