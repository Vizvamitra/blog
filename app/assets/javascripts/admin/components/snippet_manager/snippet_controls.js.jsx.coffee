window.SnippetControls = React.createClass
  handleEnterPreviewMode: (e)->
    this.props.onEnterPreviewMode() if !this.props.isPreviewing

  handleEnterEditMode: (e)->
    this.props.onEnterEditMode() if this.props.isPreviewing

  handleMoveUp: (e)->
    e.preventDefault()
    index = this.props.i
    this.props.onMoveUp(index)

  handleMoveDown: (e)->
    e.preventDefault()
    index = this.props.i
    this.props.onMoveDown(index)

  handleDelete: (e) ->
    e.preventDefault()
    if confirm('Вы уверены?')
      index = this.props.i
      this.props.onDelete(index)

  render: ->
    typeIconClass = switch this.props.type
      when 'text' then 'fa fa-file-text-o'
      when 'embed' then 'fa fa-code'

    editButtonClass = 'active' if !this.props.isPreviewing
    previewButtonClass = 'active' if this.props.isPreviewing

    `<div className='snippet-controls'>
      <div className='col-xs-2 snippet-type'>
        <span className={typeIconClass}></span>
      </div>
      <div className='col-xs-2'>
        <a className={editButtonClass} onClick={this.handleEnterEditMode}><span className='fa fa-pencil'></span></a>
      </div>
      <div className='col-xs-2'>
        <a className={previewButtonClass} onClick={this.handleEnterPreviewMode}><span className='fa fa-eye'></span></a>
      </div>
      <div className='col-xs-2'>
        <a onClick={this.handleMoveUp}><span className='fa fa-chevron-up'></span></a>
      </div>
      <div className='col-xs-2'>
        <a onClick={this.handleMoveDown}><span className='fa fa-chevron-down'></span></a>
      </div>
      <div className='col-xs-2'>
        <a onClick={this.handleDelete}><span className='fa fa-trash'></span></a>
      </div>
    </div>`