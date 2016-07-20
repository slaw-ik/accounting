$ ->
  MyDateField = (config) ->
    jsGrid.Field.call this, config
    return

  MyDateField.prototype = new (jsGrid.Field)(
    css: 'date-field'
    align: 'center'
    myCustomProperty: 'foo'
    sorter: (date1, date2) ->
      new Date(date1) - (new Date(date2))
    itemTemplate: (value) ->
      new Date(value).toDateString()
    insertTemplate: (value) ->
      @_insertPicker = $('<input>').datepicker(defaultDate: new Date)
    editTemplate: (value) ->
      @_editPicker = $('<input>').datepicker().datepicker('setDate', new Date(value))
    insertValue: ->
      @_insertPicker.datepicker('getDate').toISOString()
    editValue: ->
      @_editPicker.datepicker('getDate').toISOString()
  )
  jsGrid.fields.date = MyDateField