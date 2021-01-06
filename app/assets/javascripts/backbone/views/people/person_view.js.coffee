MyApp.Views.People ||= {}

class MyApp.Views.People.PersonView extends Marionette.ItemView
  template: JST["backbone/templates/people/person"]

  tagName: "tr"
  events:
    "click .destroy" : "destroy"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false
