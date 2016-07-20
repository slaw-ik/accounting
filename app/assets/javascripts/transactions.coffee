# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  source_url = $('#transactionsGrid').data('source')
  getCategories = () ->
    $.merge(
      [{name: '- All Categories -', id: 0}],
      $.ajax(
        type: 'GET'
        url: '/categories'
        dataType: 'json'
        async: false
        success: (data) ->
          data
      ).responseJSON
    )

  $('#transactionsGrid').jsGrid
    width: '100%'
    filtering: true
    inserting: true
    editing: true
    sorting: true
    paging: true
    autoload: true
    pageSize: 10
    pageButtonCount: 5
    deleteConfirm: 'Do you really want to delete transaction?'
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
        title: 'Transaction name'
        type: 'text'
        width: 150
        filtering: true
        validate: "required"
      }
      {
        name: 'category_id'
        type: 'select'
        title: 'Category'
        items: getCategories()
        valueField: 'id'
        textField: 'name'
        validate: (value, item) ->
          value > 0
      }
      {
        name: 'sum'
        title: 'Sum'
        type: 'number'
        width: 50
        filtering: false
        validate: (value, item) ->
          value != 0
      }
      {
        name: 'created_at'
        type: 'text'
        title: 'Created'
        filtering: false
        sorting: false
        editing: false
        inserting: false
      }
      {type: 'control'}
    ]
  return
