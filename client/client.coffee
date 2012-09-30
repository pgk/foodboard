
Template.foodboard.selected_venue = ->
  venue = Venues.findOne Session.get("selected_venue")
  if venue
    Session.set "venue_id", venue._id
    venue.name

Template.foodboard.venue_id = ->
  venue = Venues.findOne Session.get('venue_id')
  venue.name if venue?

Template.navbar.venues = ->
  Venues.find {}, {sort: {score: -1, name: 1}}

Template.foodboard.items = ->
  venue_id = Session.get 'venue_id'
  return {} if not venue_id

  Items.find venue_id: venue_id

Template.item.hour = ->
	date = new Date @.timestamp
	date.toLocaleTimeString()
