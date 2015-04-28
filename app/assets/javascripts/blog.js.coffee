# В качестве модульного загрузчика лучше использовать require.js

window.Blog = {
  modules: [], # не обязательно ставить запятую

  register: (module)->
    # На вкус и цвет, но скобки вполне можно опускать
    # this.modules.push(module)
    this.modules.push(module)

  # «The official CoffeeScript convention is camelcase» ©
  # https://github.com/polarmobile/coffeescript-style-guide#naming-conventions
  init_all: ->
    
    this.modules.forEach (module)->
      module.init()
}

# про Turbolinks я ничего не знаю, но две инициализации выглядят странно.
# init_all точно два раза не срабатывает?
$ -> Blog.init_all()
$(document).on 'page:load', -> Blog.init_all()
