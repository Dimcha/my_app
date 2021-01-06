MyApp.Views.People ||= {}

class MyApp.Views.People.UploadRowView extends Marionette.ItemView
  template: JST["backbone/templates/people/upload_row"]

  tagName: 'tr'
  events:
    'click button' : 'save'

  modelEvents:
    'change': 'render'

  save: () ->
    context = @
    person = {}

    _.each @$el.find('input'), (attr) ->
      person[attr.name] = attr.value

    $.ajax
      url: '/people'
      type: 'POST'
      contentType: 'application/json'
      data: JSON.stringify(person)
      processData: false
      cache: false
      success: (data) ->
        context.model.set(data)
      error: (data) ->
        context.model.set(data)
