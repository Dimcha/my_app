MyApp.Views.People ||= {}

class MyApp.Views.People.LoaderView extends Marionette.ItemView
  template: JST["backbone/templates/people/loader"]

  events:
    "submit #loader": "upload"

  upload: (e) ->
    e.preventDefault()
    e.stopPropagation()

    context = @
    formData = new FormData e.target
    formData.append('authenticity_token', $('meta[name="csrf-token"]').attr "content")

    $.ajax
      url: '/people/upload'
      type: 'POST'
      dataType: "json"
      data: formData
      enctype: 'multipart/form-data'
      processData: false
      contentType: false
      cache: false

      success: (data) ->
        context.collection.reset()
        context.collection.add data

        window.location.hash = "/upload_check"

