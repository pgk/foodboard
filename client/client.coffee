
Template.userstatus.logged_in = ->
  Session.get('user')

Template.userlogin.events
  'click #login': ->
    user = Users.findOne({username: 'panos'})
    if user and user.password
      Session.set('user', this._id)

Template.foodboard.venues = ->
  Venues.find({}, {sort: {score: -1, name: 1}})

Template.foodboard.selected_name = ->
  player = Venues.findOne(Session.get("selected_venue"))
  player && player.name

Template.venue.selected = ->
  Session.equals("selected_venue", this._id) ? "selected" : ''

Template.foodboard.events
  'click input.inc': ->
    Venues.update(Session.get("selected_venue"), {$inc: {score: 1}})

Template.venue.events
  'click': ->
    Session.set("selected_venue", this._id)