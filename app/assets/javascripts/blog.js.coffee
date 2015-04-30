window.Blog = {
  modules: [],

  register: (module)->
    @modules.push module

  initAll: ->
    module.init() for module in @modules 
}

$ -> Blog.initAll()
$(document).on 'page:load', -> Blog.initAll()