App.CalendarController = Ember.ObjectController.extend
  year: (-> 
    @get('model').getFullYear()
  ).property('model')
  month: (->
    @get('model').getMonth()+1
  ).property('model')
  day: (->
    @get('model').getDate()
  ).property('model')
  formattedDate: (->
    formattedDate = @get('month')+1+"/"+@get('day')+"/"+@get('year') 
  ).property 'year','month','day'
  datesinMonth: (->
    days = []
    month = @get('month')+1
    year =  @get 'year'
    noofdays = new Date(year,month,0).getDate();
    days.push(new Date(year, month-1,i))  for i in [1..noofdays]
    console.log(days);  
    return days
  ).property 'year','month'  
  datesofPrevMonth : (->
    prevDates = []
    currMonth = @get 'month'
    currYear  = @get 'year'
    firstday = new Date(currYear,currMonth,1).getDay();
    prevDates.push(new Date(currYear,currMonth,1-i)) for i in [firstday..0]
    return prevDates;
  ).property 'year','month'
  datesofNextMonth : (->
    nextDates = []
    currMonth = @get 'month'
    currYear = @get 'year'
    daysofprevmonth = new Date(currYear,currMonth,1).getDay()
    daysincurrmonth = new Date(currYear,currMonth+1,0).getDate()
    daysinnextmonth = 42-(daysofprevmonth+daysincurrmonth); #There can be a maximum of 6 week rows in a calendar and hence 7*6
    nextDates.push(new Date(currYear, currMonth, daysincurrmonth+i)) for i in [1..daysinnextmonth]
    return nextDates
  ).property 'year','month'
  datesinCalendarMonth : (-> #How the dates as displayed in the calendar of a month
    currMonth = @get 'datesinMonth'
    prevMonth = @get 'datesofPrevMonth'
    nextMonth = @get 'datesofNextMonth'
    prevMonth.concat currMonth. concat nextMonth
  ).property 'datesinMonth','datesofPrevMonth','datesofNextMonth'
  datesinCalendarWeek : (->  #How the dates are displayed weekly
    week = []
    dates = @get 'datesinCalendarMonth'
    week.push(dates.slice(i, i+7)) for i in [0..dates.length] by 7 
    return week;
  ).property 'datesinCalendarMonth' 
