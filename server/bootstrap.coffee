
Meteor.startup ->
	if Venues.find().count() is 0 and Application.config.env is 'development'
		timestamp = Date.now()
		strega_id = Venues.insert {name: 'Lastrega', score: 0}
		simply_id = Venues.insert {name: 'Simply Burgers', score: 0}
		o1_id = Orders.insert({venue_id: strega_id, timestamp: timestamp - (0 * 1000000), user_name: 'Guest'})
		o2_id = Orders.insert({venue_id: simply_id, timestamp: timestamp - (0 * 1000000), user_name: 'Guest'})
		for item in ["Porchini", "Napolitana", "Funghi"]
			Items.insert {order_id: o1_id, name: item, count: 0, timestamp: timestamp}
		for item in ["Cowboy", "Godfather", "Quickie"]
			Items.insert {order_id: o2_id, name: item, count: 0, timestamp: timestamp}

