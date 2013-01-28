Wistia-API
==========

Ruby wrapper for Wistia's API

Installation
------------

## Required gems:

* activeresource >= 2.3.8
* configatron >= 2.6.4

## Install:

    gem install wistia-api

Basic Usage
-----------

Start by requiring wistia:

    require 'wistia'

Configure your API password:

    Wistia.password = 'your-api-password-here'

**NOTE:** [see the instructions for generating an API password](http://wistia.com/doc/data-api#getting_started)

Now you can use the <tt>Wistia::Media</tt>, <tt>Wistia::Project</tt>, and <tt>Wistia::Projects::Sharing</tt> classes as ActiveResource wrappers around Wistia's API.

See http://wistia.com/doc/data-api for more info.

Configuration Options
---------------------

Set the format of the API:

    Wistia.format = 'json'  # This is the default.
    Wistia.format = 'xml'

Read configuration from an external YAML file:

    Wistia.use_config!(path_to_yaml)

For an example YAML config, see spec/support/config.local.yml

Configure using a Hash:

    Wistia.use_config!(:wistia => {
      :api => {
        :password => 'your-api-password',
        :format => 'xml-or-json'
      }
    })

Examples
--------

List all Media in your account:

    Wistia::Media.find(:all)

List all Projects in your account:

    Wistia::Project.find(:all)

List all Sharing objects for project 23:

    Wistia::Projects::Sharing.find(:all, :params => { :project_id => 23 })

Get stats for a project since the December 1, 2012

    Wistia::Stats::Project.get('efjh6kxmc9/by_date', :start_date => '2012-12-01')

List Overall Stats for Your Account

    Wistia::Stats::Account.find_singleton

Copyright
---------

Copyright (c) 2011 Wistia, Inc. See LICENSE.txt for
further details.
