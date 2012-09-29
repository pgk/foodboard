
Template.venue.selected = ->
  Session.equals("selected_venue", this._id) ? "selected" : ''

Template.venue.events
  'click': ->
    Session.set("selected_venue", this._id)
    Session.set("venue_id", this._id)

Template.venue_new.events okCancelEvents('.add-item-text'
		ok: (value) ->
			Venues.insert({name: value, score: 0})
	)
