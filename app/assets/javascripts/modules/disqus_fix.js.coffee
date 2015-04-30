DisqusFix = {
  disqus_shortname: 'vizvamitra', # используй camselCase и лучше не ставь в конце запятую

  init: ->
    # удалять свойство из объекта лучше специальным оператором:
    # delete window.DISQUSWIDGETS
    window.DISQUSWIDGETS = undefined; # не ставь точку с запятой в конце
    
    # используй строковую интерполяцию
    # $.getScript "http://#{@disqusShortname}.disqus.com/count.js"
    $.getScript("http://" + this.disqus_shortname + ".disqus.com/count.js");
}

Blog.register(DisqusFix)
