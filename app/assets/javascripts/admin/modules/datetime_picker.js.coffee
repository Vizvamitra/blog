Blog.define 'DatetimePicker', ->
  return {
    init: ->
      $('.datetimepicker').datetimepicker
        lang: 'ru'
        format:'d.m.Y H:i'
  }