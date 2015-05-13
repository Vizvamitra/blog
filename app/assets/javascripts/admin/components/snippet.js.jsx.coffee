window.Snippet = React.createClass
  render: ->
    type = this.props.snippet._type.split('::').pop().toLowerCase()
    props = {
      key: this.props.snippet._id.$oid,
      id: this.props.snippet._id.$oid,
      body: this.props.snippet.body,
      i: this.props.i
    }

    snippet_content = React.createElement(Snippets[type], props )
    snippetClass = "snippet #{type}-snippet"

    `<div className={snippetClass}>
      <SnippetControls type={type}/>
      {snippet_content}
    </div>`
