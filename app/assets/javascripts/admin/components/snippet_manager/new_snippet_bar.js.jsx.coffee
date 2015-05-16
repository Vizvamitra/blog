window.NewSnippetBar = React.createClass
  onCreateTextSnippet: ->
    snippet = {
      _type: 'Snippets::Text', 
      _id: this.uniqueId(),
      body: '',
      isNewRecord: true
    }
    this.props.onCreate(snippet)

  onCreateEmbedSnippet: ->
    snippet = {
      _type: 'Snippets::Embed', 
      _id: this.uniqueId(),
      body: '',
      isNewRecord: true
    }
    this.props.onCreate(snippet)

  uniqueId: ->
    Math.random().toString(36).substr(2,14)

  render: ->
    `<div id='new-snippet-bar'>
      <div className='col-xs-2' id='plus-container'>
        <span className='fa fa-plus'></span>
      </div>

      <div className='col-xs-5'>
        <a onClick={this.onCreateTextSnippet}><span className='fa fa-file-text-o'></span></a>
      </div>
      <div className='col-xs-5'>
        <a onClick={this.onCreateEmbedSnippet}><span className='fa fa-code'></span></a>
      </div>
    </div>`
