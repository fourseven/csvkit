# CSVKit

CSVKit is a middleware component aimed to allow tables found in a rails page to be effortlessly converted into a csv that can be read in excel (tsv format).

By adding and configuring the middleware you can visit .csv format pages with tables and instantly get the .csv versions of them without having to build a processor or formatter.

## Installation

Add this line to your application's Gemfile:

    gem 'csvkit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install csvkit

## Usage

Include the following in your `application.rb` file

    require 'csvkit'
    config.middleware.use CSVKit::Middleware, {}#, :only => [%r[^/reports], %r[^/budgeting]]

## Options and Conditions

There are two hashes passed in after `config.middleware.use CSVKit::Middleware`, the `options` hash and the `conditions` hash.

### Options

This is not currently used.


### Conditions

The conditions hash supports the following attributes:

* `:only` which is an array of regular expressions to support .csv conversion on
* `:except` which is an array of regular expressions to exclude .csv conversion on

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Author:: Mathew Hartley (<matt@route66.sytes.net>)
