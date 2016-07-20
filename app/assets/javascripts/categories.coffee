# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  source_url = $('#categoriesGrid').data('source')

  $('#categoriesGrid').jsGrid
    width: '100%'
    filtering: true
    inserting: true
    editing: true
    sorting: true
    paging: true
    autoload: true
    pageSize: 10
    pageButtonCount: 5
    deleteConfirm: 'Do you really want to delete category?'
    controller:
      loadData: (filter) ->
        $.ajax(
          type: 'GET'
          url: source_url
          data: filter
          dataType: 'json'
        )
      insertItem: (item) ->
        $.ajax
          type: 'POST'
          url: source_url
          data: item
          dataType: 'json'
      updateItem: (item) ->
        $.ajax
          type: 'PUT'
          url: "#{source_url}/#{item.id}"
          data: item
          dataType: 'json'
      deleteItem: (item) ->
        $.ajax
          type: 'DELETE'
          url: "#{source_url}/#{item.id}"
          dataType: 'json'
    rowClick: (event, data) ->
      false
    fields: [
      {
        name: 'name'
        type: 'text'
        title: 'Category'
        width: 150
        validate: "required"
      }
      {type: 'control'}
    ]
  return
