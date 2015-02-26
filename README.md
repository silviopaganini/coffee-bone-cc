# Coffee-bone-cc

Fork from Coffee-Bone for Creative Coding.

### Install

1. Clone repo into `[DIR NAME]`
2. `$ cd [DIR NAME]`
3. `$ npm install` *you might need to run it twice, gulp-sass is currently buggy*
4. `$ node install.js [APP NAMESPACE]` *optional - just namespaces app in all coffee files*
5. `$ ./server/run`
* (new tab)
6. `$ gulp`

### Gulp tasks

* `$ gulp` - *development mode*
    * Watchify (browserify)
    * Compile Sass
    * Autoprefix CSS
    * Minify XML templates
    * Optimise images
    * BrowserSync (local server)
    * + watch for changes in `.coffee`, `.scss`, `templates.xml` and images, trigger repeat

* `$ gulp build` - *pre-deploy build*
    * Browserify
    * Remove `console.log`s
    * Compile Sass
    * Autoprefix CSS
    * Combine media queries
    * Minify CSS
    * Minify XML templates
    * Concatenate vendor JS
    * Uglify JS (vendor + main application JS)
    * Custom modernizr build based on refs used through app *-- TO DO*
    * Iconizr *-- TO DO*

* Others:
    * *Check `/gulp/tasks` - each file corresponds to an individual gulp task*

### General FE app structure notes

* `Router.coffee` - capture / modify URL hashChange events
* `Nav.coffee` - list all available site routes, handle / delegate URL hashChange events
* `AppView.coffee` - Core view, all UI bound here. Anything with a deeplink in `Wrapper`, any modal-only content in `ModalManager`
* `Wrapper.coffee`
    * mapping for all site deeplinked views
    * each view may be an `AbstractViewPage` or `AbstractViewModal`
    * handle management of deeplinked pages / modals based on view 'type' and history state
    * trigger sub-route event changing
* `AbstractViewPage` / `AbstractViewModal` - URL based pages, built in methods for page transitions
* `_ModalManager.coffee` - custom modal management (non URL-based popups)

### Included JS libs

* Backbone (+ jQuery + Underscore + Backbone DeepModel)
* TweenMax.js

### Sass

* Normalise
* Custom easing
* Various helpers + mixins
