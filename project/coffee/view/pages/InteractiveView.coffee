AbstractViewPage = require '../AbstractViewPage'

class InteractiveView extends AbstractViewPage

    id : 'interactive'

    init : =>

        w = window.innerWidth
        h = window.innerHeight

        @canvas = document.createElement 'canvas'
        @canvas.width = w
        @canvas.height = h

        @addChild @canvas

        # @stage = new PIXI.Stage()
        # @renderer = new PIXI.CanvasRenderer w, h,
        #     transparent : true
        #     antialias : true

        # @view = @renderer.view

        @draw()
        @update()

        @setListeners 'on'

        null

    ###
    1 - DRAW, 2 - UPDATE, 3 - RENDER
    ###

    draw : =>
        null

    update : =>
        @render()
        requestAnimationFrame @update
        null

    render : =>
        # @renderer.render @stage
        null

    ###
    EVENTS
    ###

    setListeners : (setting) =>
        @__NAMESPACE__().appView[setting] @__NAMESPACE__().appView.EVENT_UPDATE_DIMENSIONS, @onUpdateDims
        null

    onUpdateDims : =>

        w = window.innerWidth
        h = window.innerHeight

        @canvas.width = w
        @canvas.height = h

        # @renderer.resize w, h

        null

module.exports = InteractiveView
