# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  source_url = $('#activitiesGrid').data('source')
  getActionTypes = () ->
    $.merge(
      [{name: '- All Actions -', id: -1}],
      $.ajax(
        type: 'GET'
        url: '/activities/types'
        dataType: 'json'
        async: false
        success: (data) ->
          data
      ).responseJSON
    )

  $('#activitiesGrid').jsGrid
    width: '100%'
    filtering: true
    inserting: false
    editing: false
    sorting: true
    paging: true
    autoload: true
    pageSize: 10
    pageButtonCount: 5
    controller:
      loadData: (filter) ->
        $.ajax(
          type: 'GET'
          url: source_url
          data: filter
          dataType: 'json'
        )
    rowClick: (event, data) ->
      false
    fields: [
      {
        name: 'action_type'
        type: 'select'
        title: 'Action'
        width: 150
        items: getActionTypes()
        valueField: 'id'
        textField: 'name'
      }
      {
        name: 'created_at'
        type: 'text'
        title: 'Created'
        filtering: false
      }
      {
        type: 'control'
        editButton: false
        deleteButton: false
      }
    ]
  return
