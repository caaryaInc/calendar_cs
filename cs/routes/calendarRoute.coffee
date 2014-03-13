App.CalendarRoute = Ember.Route.extend
  model: (params) -> 
    year : params.year
    month : params.month
    day: params.day
    new Date year,month,day
  serialize: (model) -> 
    { year: model.getFullYear(), month: model.getMonth()+1, day: model.getDate() }
  actions: 
    prevYear:->
      date = @controller.get 'model' 
      newDate = new Date date.getFullYear()-1, date.getMonth(), date.getDate()
      @transitionTo "calendar.show", newDate
    nextYear:->
      date = @controller.get 'model'
      newDate = new Date date.getFullYear()+1, date.getMonth(), date.getDate()
      @transitionTo "calendar.show", newDate
    prevMonth:->
      date = @controller.get 'model'
      newDate = new Date date.getFullYear(), date.getMonth()-1, date.getDate()
      @transitionTo "calendar.show", newDate
    nextMonth:->
      date = @controller.get 'model'
      newDate = new Date date.getFullYear()-1, date.getMonth()+1, date.getDate()
      @transitionTo "calendar.show", newDate  
    today: ->
      newDate = new Date()
      @transitionTo "calendar.show", newDate