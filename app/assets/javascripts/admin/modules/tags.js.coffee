Blog.define 'Tags', ->
  options = {
    'no-duplicate': true,
    'tag-box-class': 'tagging form-control',
    'no-spacebar': true,
    'edit-on-delete': false,
    'forbidden-chars': [",", "?"]
  }

  return {
    init: ->
      $('#tag-box').tagging(@options)
  }
