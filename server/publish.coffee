Venues = new Meteor.Collection 'venues'
Items = new Meteor.Collection 'items'
Orders = new Meteor.Collection 'orders'

Meteor.publish 'venues', ->
	Venues.find()

Meteor.publish 'orders', (venue_id)->
	Orders.find venue_id: venue_id

Meteor.publish 'items', (venue_id) ->
	Items.find venue_id: venue_id
