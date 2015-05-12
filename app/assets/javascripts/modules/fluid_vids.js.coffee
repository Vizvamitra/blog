Blog.define 'FluidVids', ->
  selectors = ['iframe', 'object']
  players = ['www.youtube.com', 'player.vimeo.com', 'otvi']

  return {
    init: ->
      fluidvids.init({
        selector: selectors,
        players: players
      })
    }