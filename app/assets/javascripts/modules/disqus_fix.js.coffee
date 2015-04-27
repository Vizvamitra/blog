DisqusFix = {
  disqus_shortname: 'vizvamitra',

  init: ->
    window.DISQUSWIDGETS = undefined;
    $.getScript("http://" + this.disqus_shortname + ".disqus.com/count.js");
}

Blog.register(DisqusFix)