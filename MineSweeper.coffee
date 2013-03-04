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

    _.each lines, (line, idy) ->
      lines[idy] = line.replace(/\./g, '0').split('')

    _.each lines, (line, lineIndex) ->
      _.each line, (square, idx) ->
        return if lines[lineIndex][idx] == '*'

        lines[lineIndex][idx]++ if lines[lineIndex][idx - 1] is '*'
        lines[lineIndex][idx]++ if lines[lineIndex][idx + 1] is '*'

        if lines[lineIndex + 1]?
          lines[lineIndex][idx]++ if lines[lineIndex + 1][idx] is '*'
        if lines[lineIndex - 1]?
          lines[lineIndex][idx]++ if lines[lineIndex - 1][idx] is '*'

    return lines.join('\n').replace(/\,/g, '')