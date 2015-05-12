window.SnippetManager = React.createClass
  render: ->
    snippets = this.props.snippets.map (snippet, i)->
      type = snippet._type.split('::').pop()
      props = {
        key: snippet._id.$oid,
        id: snippet._id.$oid,
        body: snippet.body,
        i: i
      }
      React.createElement(Snippets[type], props )

    `<div className='snippets'>
      {snippets}
    </div>`
