Venues = new Meteor.Collection "venues"
Items = new Meteor.Collection "items"
Orders = new Meteor.Collection 'orders'

Session.set 'venue_id', null
Session.set 'item_id', null
Session.set 'order_id', null

Meteor.subscribe 'venues', ->
  if not Session.get 'venue_id'
    venue = Venues.findOne {}, {sort: {name: 1}}
    Session.set 'venue_id', venue._id	

Meteor.autosubscribe ->
  order_id = Session.get 'order_id'
  venue_id = Session.get 'venue_id'
  Meteor.subscribe('items', order_id) if order_id?
  Meteor.subscribe('orders', venue_id) if venue_id?