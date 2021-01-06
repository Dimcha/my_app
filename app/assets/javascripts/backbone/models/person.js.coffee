class MyApp.Models.Person extends Backbone.Model
  paramRoot: 'person'

  defaults:
    first_name: null
    last_name: null
    email: null
    phone: null
    error_messages: null

class MyApp.Collections.PeopleCollection extends Backbone.Collection
  model: MyApp.Models.Person
  url: '/people'
