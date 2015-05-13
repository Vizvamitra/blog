window.SnippetManager = React.createClass
  getInitialState: ->
    this.props

  render: ->
    snippets = this.state.snippets.map (snippet, i)->
      `<Snippet snippet={snippet} i={i}/>`

    `<div id='snippets'>
      {snippets}
    </div>`
