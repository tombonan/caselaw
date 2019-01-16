## Table of Contents

- [Jurisdictions](#jurisdictions)
- [Cases](#cases)

## Jurisdictions

You can lookup a Jurisdiction by id

```ruby
client.jurisdiction(31)
```

or by the full name if the id is unknown

```ruby
client.jurisdiction_by_name("Colorado")
```

To recieve an array with all 62 jurisdictions and related information

```ruby
search = client.search_jurisdictions
jurisdiction_array = search.results
```

If you wish to find out the slug of a specific jurisdiction

```ruby
slug = Caselaw::Jurisdiction.get_by_name("Utah") # => 'utah'
```

or you can retrieve the slug by the jurisdiction id

```ruby
slug = Caselaw::Jurisdiction.get_by_id(12) # => 'utah'
```

## Cases

