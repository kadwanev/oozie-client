# OozieClient for Ruby

Standalone client for the Apache Oozie workflow engine.

## Installation

Add this line to your application's Gemfile:

    gem 'oozie-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install oozie-client

## Usage

Create Client

    oozie = OozieClient.new "http://OOZIE_URL"

Create Workflow

    workflow = oozie.jobs.create {prop1 => value1, prop2 => value2, etc}

    workflow.start
    workflow.info

    oozie.jobs[oozie_id].info
    oozie.jobs.first


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
