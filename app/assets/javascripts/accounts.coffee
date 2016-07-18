# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#jsGrid').jsGrid
    height: '80%'
    width: '100%'
    filtering: true
    inserting: true
    editing: true
    sorting: true
    paging: true
    autoload: true
    pageSize: 10
    pageButtonCount: 5
    deleteConfirm: 'Do you really want to delete client?'
    controller:
      loadData: (filter) ->
        $.ajax(
          type: 'GET'
          url: $('#jsGrid').data('load')
          data: filter
          dataType: 'json'
        )
#      insertItem: (item) ->
#        $.ajax
#          type: 'POST'
#          url: '/clients'
#          data: item
#      updateItem: (item) ->
#        $.ajax
#          type: 'PUT'
#          url: '/clients/' + item.id
#          data: item
#      deleteItem: (item) ->
#        $.ajax
#          type: 'DELETE'
#          url: '/clients/' + item.id
    fields: [
      {
        name: 'name'
        type: 'text'
        width: 150
        filtering: false
      }
      {
        name: 'critical_sum'
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
      {type: 'control'}
    ]
  return
