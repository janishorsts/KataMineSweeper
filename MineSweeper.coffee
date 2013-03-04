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
      {input: ".\n*",    output: "1\n*"}
      {input: ".*\n.*",    output: "2*\n2*"}
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
    lines = @options.input.split('\n')

    # Generate Array for Grid
    _.each lines, (line, idy) ->
      lines[idy] = line.replace(/\./g, '0').split('')

    # Iterate grid and check relative positions for mines
    _.each lines, (line, idy) ->
      _.each line, (square, idx) ->
        return if lines[idy][idx] == '*'
        lines[idy][idx]++ if lines[idy][idx - 1] is '*'
        lines[idy][idx]++ if lines[idy][idx + 1] is '*'
        if lines[idy + 1]?
          lines[idy][idx]++ if lines[idy + 1][idx] is '*'
        if lines[idy - 1]?
          lines[idy][idx]++ if lines[idy - 1][idx] is '*'

    # Flatten Array
    return lines.join('\n').replace(/\,/g, '')