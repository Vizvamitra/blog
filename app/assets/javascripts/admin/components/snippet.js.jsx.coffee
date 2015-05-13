window.Snippet = React.createClass
  render: ->
    type = this.props.snippet._type.split('::').pop().toLowerCase()
    props = {
      key: this.props.snippet._id,
      body: this.props.snippet.body,
      isDeleting: this.props.snippet.isDeleting,
      i: this.props.i
    }

    snippet_content = React.createElement(Snippets[type], props )
    snippetClass = "snippet #{type}-snippet"

    `<div className={snippetClass}>
      <SnippetControls type={type}
                       i={this.props.i}
                       onDelete={this.props.deleteSnippetFunc}
                       onMoveUp={this.props.moveSnippetUpFunc}
                       onMoveDown={this.props.moveSnippetDownFunc}/>
      {snippet_content}
    </div>`
