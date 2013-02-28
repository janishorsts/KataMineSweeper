expect = require('chai').expect

class MineSweeper

  dimension: (@dimension) ->

  display: ->
    if @dimension.height is 0 or @dimension.width is 0
      return ''

    result = for square in [1..@dimension.width]
      '0'
    result.join ''


describe 'MineSweeper', ->
    describe '#display()', ->
        it 'should display "" if height is zero', ->
            mineSweeper = new MineSweeper
            mineSweeper.dimension width: 0, height: 1
            expect(mineSweeper.display()).to.equal ''
        it 'should display "" if width is zero', ->
            mineSweeper = new MineSweeper
            mineSweeper.dimension width: 1, height: 0
            expect(mineSweeper.display()).to.equal ''
        it 'should display "0" if dimension is 1x1', ->
            mineSweeper = new MineSweeper
            mineSweeper.dimension width: 1, height: 1
            expect(mineSweeper.display()).to.equal '0'
        it 'should display "0000000000" if dimension is 10x1', ->
            mineSweeper = new MineSweeper
            mineSweeper.dimension width: 10, height: 1
            expect(mineSweeper.display()).to.equal '0000000000'
        it 'should display "0\n0\n0" if dimension is 1x3', ->
            mineSweeper = new MineSweeper
            mineSweeper.dimension width: 1, height: 3
            expect(mineSweeper.display()).to.equal "0\n0\n0"