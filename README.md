# CaseLaw API Wrapper [![Build Status](https://travis-ci.org/tombonan/caselaw.svg?branch=master)](https://travis-ci.org/tombonan/caselaw)

## Requirements

Ruby 2.0+

## Installation

Install with RubyGems

```
gem install caselaw
```

## Getting started

In order to view non-whitelisted court cases, you must [register an account](https://case.law/user/register/) with Case.law and recieve an API key.

### Setting up the Client

``` ruby
client = Caselaw::Client.new(api_key: "KEY")
```

or via the shorthand version

``` ruby
client = Caselaw.new(api_key: "KEY")
```

### Global configuration

You can define the credentials for a client at a global level by creating an initiailize file. If using gem in Rails, add a file under `config/initializers`.

``` ruby
Caselaw.configure(
  api_key: "KEY"
)
```

To access the global configuration:

``` ruby
Caselaw.configuration
```

## Examples

### Lookup a Jurisdiction

You can lookup a Jurisdiction by id or the full name if unknown

```ruby
client.jurisdiction(31)
client.jurisdiction("Colorado")
```

Or get all the Jurisdictions and related information

```ruby
search = client.search_jurisdictions

search.results.each do |jurisdiction|
  jurisdiction.id	     # => jurisdiction id
  jurisdiction.name_long     # => jurisdiction full name
  jurisdiction.slug          # => slug in use on the API
end
```

### Lookup a case instance

You can search for a case with a given case id

```ruby
client.case(1021505)
```

And to return the full body of the case instance, add the `true` parameter as the second argument

```ruby
client.case(1021505, true)
```

### Search for Cases by Text

Search the full text of cases and return the cases that contain the search term. The second argument is the number of cases to be returned.

```ruby
client.search_cases("insurance", 20)
```

Or you can search multiple terms by separating the terms with a space
```ruby
client.search_cases("insurance Peoria", 20)
```

## Response Structure

Each response comes in the form of a [Hashie](https://github.com/intridea/hashie) hash to make it easier to access the data. For instance, if we search case `1021505`, we can access information about it easily with Hashie:

```ruby
c = client.case(1021505)

c.id			        # => 1021505
c.url				# => "https://api.case.law/v1/cases/1021505/"
c.name				# => "William Stone against William Boreman"
c.name_abbreviation          # => "Stone v. Boreman"
c.decision_date 		# => "1658"
```

As well as information about the Volume, Reporter, Court, and Jurisdiction that the case:

```ruby
c.court.name			# => "Maryland Court of Appeals"
c.jurisdiction.name_long 	# => "Maryland"
```