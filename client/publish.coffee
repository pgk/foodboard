Venues = new Meteor.Collection "venues"
Items = new Meteor.Collection "items"

okCancelEvents = (selector, callbacks) ->
	_default = ->
	ok = callbacks.ok or _default
	cancel = callbacks.cancel or _default
	events = {}
	events["keyup #{selector}, keydown #{selector}, focusout #{selector}"] = (evt) ->
		if evt.type is 'keydown' and evt.which is 27
			cancel.call(@, evt)
		else if evt.type is 'keyup' and evt.which == 13 or evt.type == 'focusout'
			value = String(evt.target.value || "")
			if value
				ok.call(@, value, evt)
				evt.target.value = ''
			else
				cancel.call(@, evt)
	events


Session.set 'venue_id', null
Session.set 'item_id', null

Meteor.subscribe 'venues', ->
  if not Session.get 'venue_id'
    venue = Venues.findOne({}, {sort: {name: 1}})
    Session.set 'venue_id', venue._id

Meteor.autosubscribe ->
  venue_id = Session.get 'venue_id'
  Meteor.subscribe('items', venue_id) if venue_id?