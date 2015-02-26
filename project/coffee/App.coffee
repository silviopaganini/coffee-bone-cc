Templates    = require './data/Templates'
Router       = require './router/Router'
Nav          = require './router/Nav'
AppView      = require './AppView'
MediaQueries = require './utils/data/MediaQueries'

class App

    LIVE       : null
    BASE_PATH  : window.config.hostname
    localeCode : window.config.localeCode
    objReady   : 0

    _toClean   : ['objReady', 'setFlags', 'objectComplete', 'init', 'initSDKs', 'initApp', 'go', 'cleanup', '_toClean']

    constructor : (@LIVE) ->

        @objToLoad = []

        return null

    setFlags : =>
        ua = window.navigator.userAgent.toLowerCase()
        MediaQueries.setup();
        @IS_ANDROID    = ua.indexOf('android') > -1
        @IS_FIREFOX    = ua.indexOf('firefox') > -1
        @IS_CHROME_IOS = if ua.match('crios') then true else false # http://stackoverflow.com/a/13808053
        null

    objectComplete : =>

        @objReady++
        @initApp() if @objReady >= 1

        null

    init : =>
        @templates = new Templates "/data/templates#{(if @LIVE then '.min' else '')}.xml", @objectComplete
        # if new objects are added don't forget to change the `@objectComplete` function
        null

    initApp : =>

        @setFlags()

        ### Starts application ###
        @appView = new AppView
        @router  = new Router
        @nav     = new Nav

        @go()

        null

    go : =>

        ### After everything is loaded, kicks off website ###
        @appView.render()

        ### remove redundant initialisation methods / properties ###
        @cleanup()

        null

    cleanup : =>

        for fn in @_toClean
            @[fn] = null
            delete @[fn]

        null

module.exports = App
