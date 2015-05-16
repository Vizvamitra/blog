Blog.define 'Tags', ->

  return {
    init: ->
      if $('#tag-box').length > 0
        new Taggle('tag-box', {
          tags: $('#tag-box').data('tags'),
          submitKeys: [9, 13],
          hiddenInputName: 'article[tags][]',
          placeholder: 'Тэги'
        })
  }