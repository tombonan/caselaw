dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'caselaw')
require 'pp'

client = Caselaw::Client.new(api_key: "KEY")

search = client.search_jurisdictions

search.results.each do |jurisdiction|
  pp "Name: " + jurisdiction.name_long + "| ID: " + jurisdiction.id.to_s + "| Slug: " + jurisdiction.slug
end


