Venues = new Meteor.Collection "venues"
Items = new Meteor.Collection "items"

Meteor.publish 'venues', ->
	Venues.find()

Meteor.publish 'items', (venue_id) ->
	Items.find({venue_id: venue_id})

# Meteor.startup ->
#   if Venues.find().count() == 0
#     for name in ["Simply Burgers", "Lastrega", "Noodle Bar", "Paprika", "Teo", "London"]
#       Venues.insert
#       	name: name,
#       	score: 0

#   if Items.find().count() == 0
#     for name in ["Simply Burgers", "Lastrega", "Noodle Bar", "Paprika", "Teo", "London"]
#       Items.insert
#       	name: name,
#       	count: 0

#   if Users.find().count() == 0
#     Users.insert
#     	username: 'panos',
#     	password: 'secret',
#     	logged_in: false
