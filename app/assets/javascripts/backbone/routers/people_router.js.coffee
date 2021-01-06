class MyApp.Routers.PeopleRouter extends Backbone.Router
  initialize: (options) ->
    @people = new MyApp.Collections.PeopleCollection()
    @people.reset options.people

  routes:
    "new"            : "newPerson"
    "index"          : "index"
    "loader"         : "loader"
    "upload_check"   : "upload_check"
    ":id/edit"       : "edit"
    ":id"            : "show"
    ".*"             : "index"

  newPerson: ->
    @view = new MyApp.Views.People.NewView(collection: @people)
    $("#people").html(@view.render().el)

  loader: ->
    @view = new MyApp.Views.People.LoaderView(collection: @people)
    $("#people").html(@view.render().el)

  upload_check: ->
    @view = new MyApp.Views.People.UploadTableView(collection: @people)
    $("#people").html(@view.render().el)

  index: ->
    @view = new MyApp.Views.People.IndexView(collection: @people)
    $("#people").html(@view.render().el)

  show: (id) ->
    person = @people.get(id)

    @view = new MyApp.Views.People.ShowView(model: person)
    $("#people").html(@view.render().el)

  edit: (id) ->
    person = @people.get(id)

    @view = new MyApp.Views.People.EditView(model: person)
    $("#people").html(@view.render().el)
