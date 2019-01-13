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

To access access the global configurations:

``` ruby
Caselaw.configuration # => { api_key: "KEY" }
```

To reset the global configuration:

``` ruby
Caselaw.reset_configuration
```

## Examples