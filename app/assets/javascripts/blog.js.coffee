window.Blog = window.Blog || do ->
  modules = []
  initialized = false

  define = (name, module) ->
    Blog[name] = Blog[name] || do ->
      modules.push(name)
      new_module = module()

      new_module.init() if (Blog._initialized)
      
      return new_module

    return Blog[name]

  init = ->
    Blog[name].init() for name in modules
    Blog._initialized = true

  return {
    _init: init,
    define: define,
    _modules: modules,
    _initialized: initialized,
    _registered: false
  }

Blog._initialized = false;

$ ->
  if (!Blog._registered)
    $(document).ready(Blog._init)
    $(document).on('page:load', Blog._init)

    window.Blog._registered = true