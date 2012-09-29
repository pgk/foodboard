
okCancelEvents = (selector, callbacks) ->
	_default = ->
	ok = callbacks.ok or _default
	cancel = callbacks.cancel or _default
	events = {}
	events["keyup #{selector}, keydown #{selector}, focusout #{selector}"] = (evt) ->
		if evt.type is 'keydown' and evt.which is 27
			cancel.call @, evt
		else if evt.type is 'keyup' and evt.which == 13 or evt.type == 'focusout'
			value = String(evt.target.value || "")
			if value
				ok.call @, value, evt
				evt.target.value = ''
			else
				cancel.call @, evt
	events

Template.venue.selected = ->
  Session.equals("selected_venue", this._id) ? "selected" : ''

Template.venue.events
  'click': ->
    Session.set("selected_venue", this._id)
    Session.set("venue_id", this._id)

Template.venue_new.events okCancelEvents('.add-item-text'
		ok: (value) ->
			exists = Venues.findOne({name: value})
			console.log exists
			Venues.insert({name: value, score: 0}) if not exists?
	)

Template.item_new.events okCancelEvents('.add-item-text'
		ok: (value) ->
			Items.insert({name: value, venue_id: Session.get('venue_id'), count: 1})
			Venues.update(Session.get('venue_id'), {$inc: {score: 1}})
	)

Template.item.events
  'click': -> Session.set("item_id", this._id)

  'click .plus': ->
    Items.update(Session.get('item_id'), {$inc: {count: 1}})
    Venues.update(Session.get('venue_id'), {$inc: {score: 1}})

  'click .minus': ->
    item = Items.findOne(Session.get('item_id'))
    if item and item.count > 0
      Items.update(Session.get('item_id'), {$inc: {count: -1}})
      Venues.update(Session.get('venue_id'), {$inc: {score: -1}})

  'click .delete': ->
  	item = Items.findOne(Session.get('item_id'))
  	count = item.count
  	Items.remove(Session.get('item_id'))
  	Venues.update(Session.get('venue_id'), {$inc: {score: -1 * count}})
  	Session.set('item_id', null)
