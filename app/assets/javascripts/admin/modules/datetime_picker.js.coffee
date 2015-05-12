DatetimePicker = {
  init: ->
    $('.datetimepicker').datetimepicker
      lang: 'ru'
      format:'d.m.Y H:i'
}

Blog.register(DatetimePicker)