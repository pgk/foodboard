# Set up a collection to contain player information. On the server,
# it is backed by a MongoDB collection named "players."

Meteor.startup ->
  if Players.find().count() == 0
    for name in ["Simply Burgers", "Lastrega", "Noodle Bar", "Paprika", "Teo", "London"]
      Players.insert({name: name, score: Math.floor(Math.random()*10)*5})

  if Users.find().count() == 0
    Users.insert({username: 'panos', password: 'secret', logged_in: false})
