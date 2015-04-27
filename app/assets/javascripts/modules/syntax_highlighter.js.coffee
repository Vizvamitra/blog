SyntaxHighlighter = {
  init: ->
    $('pre code').each ->
      hljs.highlightBlock(this)
}

Blog.register(SyntaxHighlighter)