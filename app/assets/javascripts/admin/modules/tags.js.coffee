Blog.define 'Tags', ->

  return {
    init: ->
      new Taggle('tag-box', {
        tags: $('#tag-box').data('tags'),
        submitKeys: [9, 13],
        hiddenInputName: 'article[tags][]',
        placeholder: 'Тэги'
      })
  }