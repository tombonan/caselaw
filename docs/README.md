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

### Specific Case Instances

You can lookup a specific case by its id

```ruby
client.case(1021505)
```

And to return the full body of the case, add the `true` parameter as the second argument

```ruby
client.case(1021505, true)
```

### Cases by Jurisdiction

### Cases by Search Term

Search through cases that have a specific search term in the body of the case. The first argument is the search term and the second is the maximum number of case results you wish to return

```ruby
client.search_cases("witchcraft", 30)
```

You can also search through the text of cases by jurisdiction where the third argument is the jurisdiciton id or name

```ruby
client.search_cases_by_jurisdiction_id("witchcraft", 30, 31)
client.search_cases_by_jurisdiction_name("witchcraft", 30, "Colorado")


