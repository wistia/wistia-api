Wistia API Gem
==============

Ruby wrapper for the [Wistia Data API](http://wistia.com/doc/data-api).

Useful as a wrapper for the `Wistia::Media`, `Wistia::Project`,
`Wistia::Projects::Sharing`, and `Wistia::Stats` classes.

See http://wistia.com/doc/data-api for more info.

## Required gems:

* activeresource >= 2.3.8

## Install:

    gem install wistia-api

## Basic Usage

Start by requiring Wistia and configuring your
[API password](http://wistia.com/doc/data-api#getting_started):

    require 'wistia'
    Wistia.password = 'your-api-password-here'


Configuration Options
---------------------

Set the format of the API:

    Wistia.format = 'json'  # This is the default.
    Wistia.format = 'xml'

Read configuration from an external YAML file:

    Wistia.use_config!(path_to_yaml)

For an example YAML config, see spec/support/config.test.yml

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

List all Sharing objects for a project:

    Wistia::Projects::Sharing.find(:all, params: { project_id: 'YOUR_PROJECT_ID' })

Get stats for a project since `December 1, 2012`

    Wistia::Stats::Project.get('YOUR_PROJECT_ID/by_date', start_date: '2012-12-01')

List Overall Stats for Your Account

    Wistia::Stats::Account.find_singleton

Find Media based on media id in your account:

    media = Wistia::Media.find('YOUR_MEDIA_ID')

so you can access all attributes of media through media object.

    media.name # => 'video name'

also you can update media attributes through this object.

    media.name = 'new video name'
    media.save  # => true

Find Project based on project id in your account:

    project = Wistia::Project.find('YOUR_PROJECT_ID')

so you can access all attributes of project through project object.

    project.name # => 'project name' 

also you can update project attributes through this object.

    project.name = 'new project name'
    project.save  # => true

Copyright
---------

Copyright (c) 2011 Wistia, Inc. See LICENSE.txt for
further details.
