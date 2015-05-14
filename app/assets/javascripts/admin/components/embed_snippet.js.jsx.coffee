window.Snippets ||= {}

Snippets['embed'] = React.createClass
  componentDidUpdate: ->
    this.reinitFluidVids()

  componentDidMount: ->
    this.reinitFluidVids()

  reinitFluidVids: ->
    Blog['FluidVids'].init()

  name_for: (field)->
    "article[snippets_attributes][][#{field}]"

  render: ->
    editClass = 'edit' + (if this.props.isPreviewing then ' hidden' else '')
    previewClass = 'preview' + (if this.props.isPreviewing then '' else ' hidden')

    `<div className='snippet-main-area'>
      <div className={editClass}>
        <input type='hidden' name={this.name_for('_type')} value='Snippets::Embed'/>
        <textarea name={this.name_for('body')} className='form-control' rows={4} defaultValue={this.props.body}/>
      </div>
      <div className={previewClass}>
        <div dangerouslySetInnerHTML={{__html: this.props.body}}/>
      </div>
    </div>`