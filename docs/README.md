## Table of Contents

- [Jurisdictions](#jurisdictions)
- [Cases](#cases)

## Jurisdictions

You can lookup a Jurisdiction by id

```ruby
client.jurisdiction(31)
```

Or by the full name if the id is unknown

```ruby
client.jurisdiction_by_name("Colorado")
```

To recieve an array with all 62 jurisdictions and related information

```ruby
search = client.search_jurisdictions
jurisdiction_array = search.results
```

## Cases

