TagsWidget = {
  init: ->
    $('#tags-widget form').submit(this.onSubmit) # @onSubmit

  onSubmit: (e) ->
    input = $(this).find('input[type=text]')
    query = input.val()
    
    e.preventDefault() if query.length == 0 # оператор == можно заменить на is
}

Blog.register(TagsWidget)
