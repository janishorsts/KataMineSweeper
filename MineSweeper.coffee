expect = require('chai').expect
_ = require 'underscore'


# TESTS

describe 'Game', ->
  describe '#display()', ->

    examples = [
      {input: '.',       output: '0'},
      {input: '*',       output: '*'},
      {input: '*.',      output: '*1'}
      {input: '.*',      output: '1*'},
      {input: '*.*',     output: '*2*'},
      {input: '.*.',     output: '1*1'},
      {input: '..*.*..', output: '01*2*10'},

      {input: "*\n.",    output: "*\n1"}
    ]

    _.each examples, (example) ->
      it "should display '#{example.output}' when input is '#{example.input}'", ->
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
    squares = @options.input.replace(/\./g, '0').split('')

    _.each squares, (square, idx) ->
      return if square == '*'
      squares[idx]++ if squares[idx - 1] is '*'
      squares[idx]++ if squares[idx + 1] is '*'

    squares.join('')