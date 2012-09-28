
Meteor.startup ->
  if Venues.find().count() == 0
    for name in ["Simply Burgers", "Lastrega", "Noodle Bar", "Paprika", "Teo", "London"]
      Venues.insert
      	name: name,
      	score: 0

  if Users.find().count() == 0
    Users.insert
    	username: 'panos',
    	password: 'secret',
    	logged_in: false
