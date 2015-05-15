window.Snippet = React.createClass
  getInitialState: ->
    {isPreviewing: false}

  switchPreviewMode: ->
    this.setState({isPreviewing: !this.state.isPreviewing})

  render: ->
    type = this.props.snippet._type.split('::').pop().toLowerCase()
    props = {
      i: this.props.i,
      _id: this.props.snippet._id
      body: this.props.snippet.body,
      isPreviewing: this.state.isPreviewing
    }

    snippet_content = React.createElement(Snippets[type], props )
    snippetClass = "snippet #{type}-snippet"

    `<div className={snippetClass}>
      <SnippetControls type={type}
                       i={this.props.i}
                       isPreviewing={this.state.isPreviewing}
                       onSwitchPreviewMode={this.switchPreviewMode}
                       onMoveUp={this.props.moveSnippetUpFunc}
                       onMoveDown={this.props.moveSnippetDownFunc}
                       onDelete={this.props.deleteSnippetFunc}/>
      {snippet_content}
    </div>`
