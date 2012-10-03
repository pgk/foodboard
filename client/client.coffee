
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

Template.venues_sidebar.venues = ->
  Venues.find {}, {sort: {score: -1, name: 1}}

Template.order.items = ->
  Items.find order_id: @._id

Template.order.is_selected = ->
	Session.get('selected_order') is @._id

Template.foodboard.orders = ->
  Orders.find {}, {sort: {timestamp: -1}}

Template.item.hour = hour
Template.order.hour = hour
Template.order.venue_name = ->
	Venues.findOne(@.venue_id).name

Template.order.hotness = ->
	diff = Date.now() - @.timestamp
	if diff <= 3000000
		return "success"
	if diff <= 4000000
		return "warning"
	"info"

