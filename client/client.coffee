Venues = new Meteor.Collection "venues"
Items = new Meteor.Collection "items"

Session.set 'venue_id', null

Meteor.subscribe 'venues', ->
  if !Session.get 'venue_id'
    venue = Venues.findOne({}, {sort: {name: 1}})
    Session.set 'venue_id', venue._id

Meteor.autosubscribe ->
  venue_id = Session.get 'venue_id'
  if venue_id
    Meteor.subscribe('items', venue_id)

Template.foodboard.venues = ->
  Venues.find({}, {sort: {score: -1, name: 1}})

Template.foodboard.items = ->
  items = Items.find({venue_id: Session.get('venue_id')})
  console.log items
  items

Template.foodboard.selected_venue = ->
  venue = Venues.findOne(Session.get("selected_venue"))
  venue && venue.name

Template.venue.selected = ->
  Session.equals("selected_venue", this._id) ? "selected" : ''

Template.foodboard.events
  'click input.inc': ->
    Venues.update(Session.get("selected_venue"), {$inc: {score: 1}})

Template.venue.events
  'click': ->
    Session.set("selected_venue", this._id)