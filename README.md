# CaseLaw API Wrapper

## Installation

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
  api_key: "KEY",
)
```

To access access the global configuration:

``` ruby
Caselaw.configuration # => { api_key: "KEY" }
```

To reset the global configuration:

``` ruby
Caselaw.reset_configuration
```

## Examples

### Lookup a Jurisdiction

You can lookup a Jurisdiction by id or the full name if unknown

```ruby
client.jurisdiction(31)
client.jurisdiction_by_name("Colorado")
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

You can search for a case with a given id

```ruby
client.case(1021505)
```

And to return the full body of the case instance, add the `full_case=true` parameter

```ruby
client.case(1021505, full_case=true)
```
