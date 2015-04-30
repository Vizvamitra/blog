DisqusFix = {
  disqusShortname: 'vizvamitra',

  init: ->
    delete window.DISQUSWIDGETS
    $.getScript "http://#{@disqusShortname}.disqus.com/count.js"
}

Blog.register(DisqusFix)
