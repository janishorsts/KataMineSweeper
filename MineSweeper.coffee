mocha = require 'mocha'
expect = require('chai').expect

describe 'Game', ->
  describe '#display()', ->
    it 'should display "0" when input is "."', ->
      game = new Game input: '.'
      expect(game.display()).to.equal '0'

describe 'MineSweeper', ->
  mineSweeper = {}

  before ->
    mineSweeper = new MineSweeper

  describe '#run()', ->

    it 'should end when input reaches 0 0', ->
      mineSweeper.input('0 0');
      expect(mineSweeper.run()).to.equal ''

class MineSweeper
  input: ->
  run: ->
    ''