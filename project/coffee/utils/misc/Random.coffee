class Random

    @shuffle : (o) =>
        `for(var j, x, i = o.length; i; j = Math.floor(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x);`
        return o

    @randomRange : (min,max) =>
        return Math.floor(Math.random()*(max-min+1)+min)

    @getRandomColor: ->

        letters = '0123456789ABCDEF'.split('')
        color = '#'
        for i in [0...6]
            color += letters[Math.round(Math.random() * 15)]
        color

module.exports = Random
