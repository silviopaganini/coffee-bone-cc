class AbstractData

	constructor : ->

		_.extend @, Backbone.Events

		return null

	B : =>

		return window.B

module.exports = AbstractData
