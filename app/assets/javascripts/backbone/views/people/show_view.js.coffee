MyApp.Views.People ||= {}

class MyApp.Views.People.ShowView extends Marionette.View
  template: JST["backbone/templates/people/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
