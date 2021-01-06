MyApp.Views.People ||= {}

class MyApp.Views.People.UploadTableView extends Marionette.CollectionView
  template: JST["backbone/templates/people/upload_table"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (person) =>
    view = new MyApp.Views.People.UploadRowView({model : person})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(people: @collection.toJSON() ))
    @addAll()

    return this
