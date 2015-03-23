window.Blog = {
  modules: [],

  register: (module)->
    this.modules.push(module)

  init_all: ->
    this.modules.forEach (module)->
      module.init()
}

$ -> Blog.init_all()
$(document).on 'page:load', -> Blog.init_all()