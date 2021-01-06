class MyApp.Views.People.IndexView extends Marionette.CompositeView
  template: JST["backbone/templates/people/index"]

  addAll: () =>
    @collection.each(@addOne)

  addOne: (person) =>
    view = new MyApp.Views.People.PersonView({model : person})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(people: @collection.toJSON() ))
    @addAll()

    return this
