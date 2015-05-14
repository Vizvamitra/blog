Blog.define 'SyntaxHighlighter', ->
  return{
    init: (scope = '')->
      $("#{scope} pre code").each ->
        hljs.highlightBlock(this)
  }