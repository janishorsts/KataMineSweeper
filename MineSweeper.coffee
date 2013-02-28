expect = require('chai').expect
_ = require 'underscore'

# TESTS
describe 'Game', ->
  describe '#display()', ->

    examples = [
      {input: '.',  output: '0'},
      {input: '*',  output: '*'},
      {input: '*.', output: '*1'}
    ]

    _.each examples, (example) ->
      it 'should display "' + example.output + '" when input is "' + example.input + '"', ->
        game = new Game input: example.input
        expect(game.display()).to.equal example.output

describe 'MineSweeper', ->
  mineSweeper = {}

  before ->
    mineSweeper = new MineSweeper

  describe '#run()', ->
    it 'should end when input reaches 0 0', ->
      mineSweeper.input('0 0');
      expect(mineSweeper.run()).to.equal ''


# CODE

class MineSweeper
  input: ->
  run: ->
    ''

class Game
  constructor: (@options) ->
  display: ->
    return '0' if @options.input is '.'
    '*'