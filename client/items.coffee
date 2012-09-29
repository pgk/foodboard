
Template.item_new.events okCancelEvents('.add-item-text'
		ok: (value) ->
			Items.insert({name: value, venue_id: Session.get('venue_id'), count: 1})
			Venues.update(Session.get('venue_id'), {$inc: {score: 1}})
	)

Template.item.events
  'click': ->
    Session.set("item_id", this._id)
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
