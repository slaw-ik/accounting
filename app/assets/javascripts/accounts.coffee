# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  source_url = $('#accountsGrid').data('source')

  $('#accountsGrid').jsGrid
    width: '100%'
    filtering: true
    inserting: true
    editing: true
    sorting: true
    paging: true
    autoload: true
    pageSize: 10
    pageButtonCount: 5
    deleteConfirm: 'Do you really want to delete account?'
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
      window.location.href = "#{source_url}/#{event.item.id}/transactions"
    fields: [
      {
        name: 'name'
        title: 'Account name'
        type: 'text'
        width: 150
        filtering: true
      }
      {
        name: 'critical_sum'
        title: 'Critical sum'
        type: 'number'
        width: 50
        filtering: false
      }
      {
        name: 'notify'
        type: 'checkbox'
        title: 'Notify'
        filtering: false
        sorting: false
      }
      {
        name: 'created_at'
        type: 'text'
        title: 'Created'
        filtering: false
        sorting: false
        editing: false
      }
      {type: 'control'}
    ]
  return
