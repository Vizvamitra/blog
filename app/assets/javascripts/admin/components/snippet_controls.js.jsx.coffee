window.SnippetControls = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    if confirm('Вы уверены?')
      index = this.props.i
      this.props.onDelete(index)

  handleMoveUp: (e)->
    e.preventDefault()
    index = this.props.i
    this.props.onMoveUp(index)

  handleMoveDown: (e)->
    e.preventDefault()
    index = this.props.i
    this.props.onMoveDown(index)

  render: ->
    typeIconClass = switch this.props.type
      when 'text' then 'fa fa-file-text-o'
      when 'embed' then 'fa fa-code'

    `<div className='snippet-controls'>
      <div className='col-xs-2 snippet-type'>
        <span className={typeIconClass}></span>
      </div>
      <div className='col-xs-2'>
        <a className='active'><span className='fa fa-pencil'></span></a>
      </div>
      <div className='col-xs-2'>
        <a><span className='fa fa-eye'></span></a>
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