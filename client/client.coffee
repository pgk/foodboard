
Template.userstatus.logged_in = ->
  Session.get('user')

Template.userlogin.events
  'click #login': ->
    user = Users.findOne({username: 'panos'})
    if user and user.password
      Session.set('user', this._id)

Template.foodboard.players = ->
  Venues.find({}, {sort: {score: -1, name: 1}})

Template.foodboard.selected_name = ->
  player = Venues.findOne(Session.get("selected_player"))
  player && player.name

Template.player.selected = ->
  Session.equals("selected_player", this._id) ? "selected" : ''

Template.foodboard.events
  'click input.inc': ->
    Venues.update(Session.get("selected_player"), {$inc: {score: 5}})

Template.player.events
  'click': ->
    Session.set("selected_player", this._id)