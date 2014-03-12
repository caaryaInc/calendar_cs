App = Ember.Application.create()
App.Router.map -> 
 @resource 'calendar', path: 'calendar/:year/:month/:day', ->
  @route 'show'
  
App.ApplicationRoute = Ember.Route.extend
  model: ->
    new Date()
  redirect: (model) -> 
    @transitionTo "calendar",model 