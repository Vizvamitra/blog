Tags = {
  options: {
    'no-duplicate': true,
    'tag-box-class': 'tagging form-control',
    'no-spacebar': true,
    'edit-on-delete': false
  },

  init: ->
    $('#tag-box').tagging(@options)
}

Blog.register(Tags)
