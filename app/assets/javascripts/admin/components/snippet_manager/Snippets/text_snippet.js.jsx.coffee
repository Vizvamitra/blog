window.Snippets ||= {}

Snippets['text'] = React.createClass
  componentDidUpdate: ->
    this.initPreview() if this.props.isPreviewing

  componentDidMount: ->
    this.initPreview() if this.props.isPreviewing

  initPreview: ->
    this.setPreviewHtml()
    this.preparePreview()

  setPreviewHtml: ->
    body = React.findDOMNode(this.refs.body)
    preview = React.findDOMNode(this.refs.preview)

    $(preview).html( marked(body.value) )

  preparePreview: ->
    Blog['SyntaxHighlighter'].init("##{this.previewId()}")

  name_for: (field)->
    "article[snippets_attributes][][#{field}]"

  previewId: ->
    "preview_#{this.props.snippet._id}"

  render: ->
    editClass = 'edit' + (if this.props.isPreviewing then ' hidden' else '')
    previewClass = 'preview' + (if this.props.isPreviewing then '' else ' hidden')

    `<div className='snippet-main-area'>
      <div className={editClass}>
        <textarea name={this.name_for('body')}
                  ref='body'
                  className='form-control'
                  rows={15}
                  defaultValue={this.props.snippet.body}/>
      </div>
      <div className={previewClass} id={this.previewId()}>
        <div className='text-snippet-body' ref='preview'/>
      </div>
    </div>`