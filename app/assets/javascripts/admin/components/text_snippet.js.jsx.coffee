window.Snippets ||= {}

Snippets['text'] = React.createClass
  name_for: (field)->
    "article[snippets_attributes][#{this.props.i}][#{field}]"

  render: ->
    `<div className='snippet-main-area'>
      <input type='hidden' name={this.name_for('_id')} value={this.props.id}/>
      <input type='hidden' name={this.name_for('_type')} value='Snippets::Text'/>
      <textarea name={this.name_for('body')} className='form-control' rows={20} defaultValue={this.props.body}/>
    </div>`