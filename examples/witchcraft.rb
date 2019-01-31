dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'caselaw')
require 'pp'

client = Caselaw::Client.new(api_key: "KEY")

cases = client.search_cases("witchcraft", 40)

cases.results.each do |c|
  pp "Jurisdiction: " + c.jurisdiction.name_long + " || " + "Case Name: " + c.name
end
  
