FluidVids = {
  init: ->
    fluidvids.init({
      selector: ['iframe', 'object'],
      players: ['www.youtube.com', 'player.vimeo.com', 'otvi']
    })
}

Blog.register(FluidVids)
