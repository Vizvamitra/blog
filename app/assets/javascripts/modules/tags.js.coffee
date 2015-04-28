Tags = {
  options: {
    # если не используешь строковую интерполяцию, то используй одинарные ковычки
    "no-duplicate": true,
    "tag-box-class": "tagging form-control",
    "no-spacebar": true,
    "edit-on-delete": false
  },

  init: ->
    $("#tag-box").tagging(this.options) # @options
}

Blog.register(Tags)
