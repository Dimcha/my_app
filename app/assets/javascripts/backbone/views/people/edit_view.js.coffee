MyApp.Views.People ||= {}

class MyApp.Views.People.EditView extends Marionette.View
  template: JST["backbone/templates/people/edit"]

  events:
    "submit #edit-person": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (person) =>
        @model = person
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
