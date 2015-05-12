Blog.define 'DisqusFix', ->
  disqusShortname = 'vizvamitra'

  return {
    init: ->
      window.DISQUSWIDGETS = undefined
      $.getScript "http://#{disqusShortname}.disqus.com/count.js"
    }