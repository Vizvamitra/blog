window.Snippet = React.createClass
  getInitialState: ->
    {isPreviewing: false}

  enterPreviewMode: ->
    this.setState({isPreviewing: true})

  enterEditMode: ->
    this.setState({isPreviewing: false})

  render: ->
    type = this.props.snippet._type.split('::').pop().toLowerCase()
    props = {
      snippet: this.props.snippet,
      isPreviewing: this.state.isPreviewing
    }

    snippetContent = React.createElement(Snippets[type], props )
    snippetClass = "snippet #{type}-snippet"
    snippetClass += ' hidden' if this.props.snippet.isDeleting

    `<div className={snippetClass}>
      <SnippetControls type={type}
                       i={this.props.i}
                       isPreviewing={this.state.isPreviewing}
                       onEnterPreviewMode={this.enterPreviewMode}
                       onEnterEditMode={this.enterEditMode}
                       onMoveUp={this.props.moveSnippetUpFunc}
                       onMoveDown={this.props.moveSnippetDownFunc}
                       onDelete={this.props.deleteSnippetFunc}/>

      <SnippetHiddenFields snippet={this.props.snippet}
                           i = {this.props.i}/>

      {snippetContent}
    </div>`
