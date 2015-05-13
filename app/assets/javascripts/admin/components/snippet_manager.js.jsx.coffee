window.SnippetManager = React.createClass
  getInitialState: ->
    this.props

  moveSnippetUp: (index)->
    if index > 0
      newSnippets = this.state.snippets
      snippet = newSnippets.splice(index, 1)[0]
      newSnippets.splice(index-1, 0, snippet)
      this.setState({snippets: newSnippets})

  moveSnippetDown: (index)->
    if index < this.state.snippets.length - 1
      newSnippets = this.state.snippets
      snippet = newSnippets.splice(index, 1)[0]
      newSnippets.splice(index+1, 0, snippet)
      this.setState({snippets: newSnippets})

  deleteSnippet: (index)->
    if index >= 0 && index < this.state.snippets.length
      newSnippets = this.state.snippets
      newSnippets.splice(index, 1)
      this.setState({snippets: newSnippets})

  render: ->
    snippets = this.state.snippets.map ((snippet, i)->
      `<Snippet snippet={snippet}
                key={snippet._id.$oid}
                i={i}
                deleteSnippetFunc={this.deleteSnippet}
                moveSnippetUpFunc={this.moveSnippetUp}
                moveSnippetDownFunc={this.moveSnippetDown}/>`
    ).bind(this)

    `<div id='snippets'>
      {snippets}
    </div>`
