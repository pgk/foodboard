
Meteor.startup ->
	if Venues.find().count() == 0
		venue_id = Venues.insert({name: 'Lastrega', score: 0})
		simply_id = Venues.insert({name: 'Simply Burgers', score: 0})
		for item in ["Data on the Wire", "Simplicity", "One Language", "Simplicity"]
			Items.insert({venue_id: venue_id, name: item, count: 0})
		for item in ["Data on the Wire", "Simplicity", "One Language", "Simplicity"]
			Items.insert({venue_id: simply_id, name: item, count: 0})

