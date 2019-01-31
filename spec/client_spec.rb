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

  describe "slug" do
    it "gets 62 jurisdictions" do
      expect(Caselaw::Jurisdiction.all.length).to eq 62
    end

    it "finds a slug by name, case-insensitive" do
      expect(Caselaw::Jurisdiction.get_by_name("Colorado")).to eq "colo"
      expect(Caselaw::Jurisdiction.get_by_name("colorado")).to eq "colo"
    end

    it "finds a slug by id" do
      expect(Caselaw::Jurisdiction.get_by_id(31)).to eq "colo"
    end
      
    context "when jurisdiction does not exist" do
      it "raises Caselaw::NotFound" do
        expect { Caselaw::Jurisdiction.get_by_name("Tom") }.to raise_error(Caselaw::NotFound)
        expect { Caselaw::Jurisdiction.get_by_id(2000) }.to raise_error(Caselaw::NotFound)
      end
    end
  end

  describe "get jurisdictions" do
    before { stub("jurisdictions/", "jurisdictions.json") }
    
    it "returns all jurisdictions" do
      search = client.search_jurisdictions
      results = client.search_jurisdictions['results']
      expect(search).to be_a Hashie::Mash
      expect(results).to be_an(Array)
    end
  end

  describe "case" do
    before { stub("cases/1021505", "case.json") }

    it "returns case instance" do
      case_instance = client.case(1021505)
      expect(case_instance).to be_a Hashie::Mash
      expect(case_instance.id).to eq 1021505
    end

    context "when case does not exist" do
      before {stub_request(:get, "https://api.case.law/v1/cases/1021505000")
         .with(
           headers: {
       	  'Authorization'=>'Token SECRET_KEY'
           })
         .to_return(status: 200, body: "", headers: {})}
      
      it "raises Caselaw::NotFound" do
        expect(client.case(1021505000).to raise_error(Caselaw::NotFound))
      end
    end
  end    
end
