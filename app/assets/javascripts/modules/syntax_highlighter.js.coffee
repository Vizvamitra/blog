Blog.define 'SyntaxHighlighter', ->
  return{
    init: ->
      $('pre code').each ->
        hljs.highlightBlock(this)
  }