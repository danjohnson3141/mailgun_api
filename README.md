mailgat rubygem
=======

A library for interfacing with the Mailgun API

mailgat exposes the following resources:

  * Sending email
  * Mailing Lists
  * Mailing List Members

## Usage

#### Configuration
```ruby
# Initialize your Mailgat object:
@mailgat = Mailgat.new(api_key: 'your-api-key-xxxxxxxxxxxxxxx', domain: 'your_domain.mailgun.org')
```


#### Mailing Lists
```ruby
# List all Mailing lists
@mailgat.lists

# Find a mailing list
@list = @mailgat.find_list("list_name")

# Create a mailing list
@list = @mailgat.create_list("list_name")

# Update mailing list properties
@list.update({description: "My Description"})

# Delete the mailing list
@list.delete


# Get the raw list properties
@list.properties

# Other properties can accessed as well
@list.members_count
@list.description
@list.created_at
@list.access_level
@list.address
@list.name

# Get the list of mailing list members.
@list.members

# Get the list stats
@list.stats
```

#### List Members
```ruby
# Find a member in the list
@list.find_member("michael.irey@gmail.com")

# Add a member to the list (using email address only)
@list.add_member("michael.irey@gmail.com")

# Add a member to the list (using hash)
@list.add_member({address: "michael.irey@gmail.com", name: "Michael Irey"})

# Add multiple members
@list.add_member([{address: "Alice <alice@example.com>", vars: {age: 26}}, {name: "Bob", address: "bob@example.com", vars: {age: 34} }])

```


#### Members
```ruby
# find all lists a member belongs to
@member.lists
```

#### Messages
```ruby
# Create a message
@message = @mailgat.create_message({})

# Send a message to a list
@list.send_message(@message, when: "Fri, 25 Oct 2011 23:10:10 -0000")
```



## TODO

  * Coming soon


## Maintainer

Michael Irey / [@michaelirey](http://github.com/michaelirey)


## Authors

Michael Irey / [@michaelirey](http://github.com/michaelirey)

See CONTRIBUTORS.md file for contributor credits.

## License

Released under the MIT license. See LICENSE for more details.