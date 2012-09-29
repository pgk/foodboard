Venues = new Meteor.Collection "venues"
Items = new Meteor.Collection "items"

Session.set 'venue_id', null
Session.set 'item_id', null

Meteor.subscribe 'venues', ->
  if not Session.get 'venue_id'
    venue = Venues.findOne {}, {sort: {name: 1}}
    Session.set 'venue_id', venue._id

Meteor.autosubscribe ->
  venue_id = Session.get 'venue_id'
  Meteor.subscribe('items', venue_id) if venue_id?