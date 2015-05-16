window.Snippets ||= {}

Snippets['embed'] = React.createClass
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

    $(preview).html(body.value)

  preparePreview: ->
    Blog['FluidVids'].init()

  name_for: (field)->
    "article[snippets_attributes][][#{field}]"

  render: ->
    editClass = 'edit' + (if this.props.isPreviewing then ' hidden' else '')
    previewClass = 'preview' + (if this.props.isPreviewing then '' else ' hidden')

    `<div className='snippet-main-area'>
      <div className={editClass}>
        <input type='hidden' name={this.name_for('_type')} value='Snippets::Embed'/>
        <textarea name={this.name_for('body')}
                  ref='body'
                  className='form-control'
                  rows={4}
                  defaultValue={this.props.snippet.body}/>
      </div>
      <div className={previewClass}>
        <div className='text-snippet-body' ref='preview'/>
      </div>
    </div>`