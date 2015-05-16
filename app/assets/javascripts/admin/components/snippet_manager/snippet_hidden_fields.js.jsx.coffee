window.SnippetHiddenFields = React.createClass
  name_for: (field)->
    "article[snippets_attributes][][#{field}]"

  render: ->
    isIdDisabled = this.props.snippet.isNewRecord

    `<div className='snippet-hidden-fields hidden'>
      <input  type='hidden'
              name={this.name_for('_type')}
              value={this.props.snippet._type}/>

      <input  type='hidden'
              name={this.name_for('_id')}
              value={this.props.snippet._id}
              disabled={isIdDisabled}/>

      <input  type='hidden'
              name={this.name_for('_destroy')}
              value={this.props.snippet.isDeleting || ''}/>

      <input  type='hidden'
              name={this.name_for('position')}
              value={this.props.i}/>
    </div>`