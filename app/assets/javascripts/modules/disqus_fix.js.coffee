DisqusFix = {
  disqusShortname: 'vizvamitra',

  init: ->
    window.DISQUSWIDGETS = undefined
    $.getScript "http://#{@disqusShortname}.disqus.com/count.js"
}

Blog.register(DisqusFix)
