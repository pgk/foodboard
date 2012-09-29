Venues = new Meteor.Collection "venues"
Items = new Meteor.Collection "items"

Meteor.publish 'venues', ->
	Venues.find()

Meteor.publish 'items', (venue_id) ->
	Items.find({venue_id: venue_id})
