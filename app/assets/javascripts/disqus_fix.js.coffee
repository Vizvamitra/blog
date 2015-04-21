DisqusFix = {
  init: ->
    window.DISQUSWIDGETS = undefined;
    $.getScript("http://" + disqus_shortname + ".disqus.com/count.js");
}

Blog.register(DisqusFix)