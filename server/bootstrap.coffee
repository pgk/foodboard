
Meteor.startup ->
	if Venues.find().count() is 0 and Application.config.env is 'development'
		timestamp = Date.now()
		strega_id = Venues.insert {name: 'Lastrega', score: 0}
		simply_id = Venues.insert {name: 'Simply Burgers', score: 0}
		for item in ["Porchini", "Napolitana", "Funghi"]
			Items.insert {venue_id: strega_id, name: item, count: 0, timestamp: timestamp}
		for item in ["Cowboy", "Godfather", "Quickie"]
			Items.insert {venue_id: simply_id, name: item, count: 0, timestamp: timestamp}
		Orders.insert({venue_id: strega_id, timestamp: timestamp - (time * 1000000), user_name: 'Guest'}) for time in [0..10]

