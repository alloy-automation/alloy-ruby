# AlloySdk
This is a basic wrapper package for sending events to the [Alloy](https://runalloy.com/) API. It exposes a single class module, that you can use across your Ruby controllers.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add alloy_sdk

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install alloy_sdk

## Usage
```
require "alloy_sdk"
AlloySdk.runalloy(
 API_KEY,
 workflowID,
 {
 parameterName: 'Parameter Value'
 },
 returnExecutionData=true)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alloy-automation/alloy-ruby.
