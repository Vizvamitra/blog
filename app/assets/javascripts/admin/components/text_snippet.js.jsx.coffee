window.Snippets ||= {}

Snippets['text'] = React.createClass
  getInitialState: ->
    id = Math.random().toString(36).substr(2,9)
    {previewId: id}

  componentDidUpdate: ->
    this.highlightPreview()

  componentDidMount: ->
    this.highlightPreview()

  highlightPreview: ->
    Blog['SyntaxHighlighter'].init("##{this.state.previewId}")

  name_for: (field)->
    "article[snippets_attributes][][#{field}]"

  previewHtml: ->
    html =  if this.props.isPreviewing then marked(this.props.body) else ''
    {__html: html}

  render: ->
    editClass = 'edit' + (if this.props.isPreviewing then ' hidden' else '')
    previewClass = 'preview' + (if this.props.isPreviewing then '' else ' hidden')

    `<div className='snippet-main-area'>
      <div className={editClass}>
        <input type='hidden' name={this.name_for('_type')} value='Snippets::Text'/>
        <textarea name={this.name_for('body')} className='form-control' rows={15} defaultValue={this.props.body}/>
      </div>
      <div className={previewClass} id={this.state.previewId}>
        <div className='text-snippet-body' dangerouslySetInnerHTML={this.previewHtml()}/>
      </div>
    </div>`