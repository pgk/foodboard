
hour = ->
	date = new Date @.timestamp
	date.toLocaleTimeString()

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

Template.foodboard.orders = ->
  venue_id = Session.get 'venue_id'
  return {} if not venue_id

  Orders.find {venue_id: venue_id}, {sort: {timestamp: -1}}

Template.item.hour = hour
Template.order.hour = hour
Template.order.venue_name = ->
	Venues.findOne(@.venue_id).name

Template.order.hotness = ->
	diff = Date.now() - @.timestamp
	if diff <= 3000000
		return "error"
	if diff <= 4000000
		return "warning"
	if diff <= 9000000
		return "success"
	"info"

