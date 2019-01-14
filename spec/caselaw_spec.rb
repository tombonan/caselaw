require 'caselaw'

RSpec.describe Caselaw do
  it "has a version number" do
    expect(Caselaw::VERSION).not_to be nil
  end

  describe ".new" do
    it "returns a new client instance" do
      expect(Caselaw.new).to be_a(Caselaw::Client)
    end
  end 
end
