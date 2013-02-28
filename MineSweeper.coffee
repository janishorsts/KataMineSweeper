expect = require('chai').expect

class MineSweeper

  dimension: (@height, @width) ->

  display: -> ''


describe 'MineSweeper', ->
    describe '#dimension()', ->
        it 'with 0 height should not be displayed', ->
            mineSweeper = new MineSweeper
            mineSweeper.dimension(0, 1);
            expect(mineSweeper.display()).to.equal('')
        it 'with 0 width should not be displayed', ->
            mineSweeper = new MineSweeper
            mineSweeper.dimension(1, 0);
            expect(mineSweeper.display()).to.equal('')
