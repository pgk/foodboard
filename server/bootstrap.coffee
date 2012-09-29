
Meteor.startup ->
	if Venues.find().count() is 0 and Application.config.env is 'development'
		strega_id = Venues.insert {name: 'Lastrega', score: 0}
		simply_id = Venues.insert {name: 'Simply Burgers', score: 0}
		for item in ["Porchini", "Napolitana", "Funghi"]
			Items.insert {venue_id: strega_id, name: item, count: 0}
		for item in ["Cowboy", "Godfather", "Quickie"]
			Items.insert {venue_id: simply_id, name: item, count: 0}

