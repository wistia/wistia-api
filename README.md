Wistia API Gem
==============

Ruby wrapper for the [Wistia Data API](http://wistia.com/doc/data-api).

Useful as a wrapper for the `Wistia::Media`, `Wistia::Project`,
`Wistia::Projects::Sharing`, `Wistia::Stats` and `Wistia::Medias::Customization` classes.

See http://wistia.com/doc/data-api for more info.

## Required gems:

* activeresource >= 2.3.8

## Install:

```bash
gem install wistia-api
```

## Basic Usage

Start by requiring Wistia and configuring your
[API password](http://wistia.com/doc/data-api#getting_started):

```ruby
require 'wistia'
Wistia.password = 'your-api-password-here'
```


Configuration Options
---------------------

Set the format of the API:

```ruby
Wistia.format = 'json'  # This is the default.
Wistia.format = 'xml'
```

Read configuration from an external YAML file:

```ruby
Wistia.use_config!(path_to_yaml)
```

For an example YAML config, see spec/support/config.test.yml

Configure using a Hash:

```ruby
Wistia.use_config!(:wistia => {
  :api => {
    :password => 'your-api-password',
    :format => 'xml-or-json'
  }
})
```

Examples
--------

List all Media in your account:

```ruby
Wistia::Media.find(:all)
```

List all Projects in your account:

```ruby
Wistia::Project.find(:all)
```

List all Sharing objects for a project:

```ruby
Wistia::Projects::Sharing.find(:all, params: { project_id: 'YOUR_PROJECT_ID' })
```

Get stats for a project since `December 1, 2012`

```ruby
Wistia::Stats::Project.get('YOUR_PROJECT_ID/by_date', start_date: '2012-12-01')
```

List Overall Stats for Your Account

```ruby
Wistia::Stats::Account.find_singleton
```

Find Media based on media id in your account:

```ruby
media = Wistia::Media.find('YOUR_MEDIA_ID')
```

so you can access all attributes of media through media object.

```ruby
media.name # => 'video name'
```

also you can update media attributes through this object.

```ruby
media.name = 'new video name'
media.save  # => true
```

Find Project based on project id in your account:

```ruby
project = Wistia::Project.find('YOUR_PROJECT_ID')
```

so you can access all attributes of project through project object.

```ruby
project.name # => 'project name'
```

also you can update project attributes through this object.

```ruby
project.name = 'new project name'
project.save # => true
```

Find Customization based on media id:

    customization = Wistia::Medias::Customization.find_by_media_id('YOUR_MEDIA_ID')
    customization.autoPlay # => 'true/false (autoPlay option)' 

Copyright
---------

Copyright (c) 2011 Wistia, Inc. See LICENSE.txt for
further details.
