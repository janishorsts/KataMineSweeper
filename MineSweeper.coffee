expect = require('chai').expect
_ = require('underscore')


# TESTS

describe 'Game', ->
  describe '#display()', ->

    examples = [
      {input: '.',       output: '0'}
      {input: '*',       output: '*'}
      {input: '*.',      output: '*1'}
      {input: '.*',      output: '1*'}
      {input: '*.*',     output: '*2*'}
      {input: '.*.',     output: '1*1'}
      {input: '..*.*..', output: '01*2*10'}

      {input: "*\n.",    output: "*\n1"}
      {input: ".\n*",    output: "1\n*"}
      {input: ".*\n.*",  output: "2*\n2*"}
      {input: "*.\n..",  output: "*1\n11"}
      {input: "*.\n..\n.*",  output: "*1\n22\n1*"}
      {input: "*...\n....\n.*..\n....", output: "*100\n2210\n1*10\n1110"}
      {input: "**...\n.....\n.*...", output: "**100\n33200\n1*100"}
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

    _.each lines, (line, idx) ->
      lines[idx] = line.replace(/\./g, '0').split('')

    _.each lines, (line, lineIdx) ->
      _.each line, (square, squareIdx) ->
        return if line[squareIdx] == '*'

        line[squareIdx]++ if line[squareIdx - 1] is '*'
        line[squareIdx]++ if line[squareIdx + 1] is '*'

        line[squareIdx]++ if lines[lineIdx + 1]?[squareIdx] is '*'
        line[squareIdx]++ if lines[lineIdx - 1]?[squareIdx] is '*'

        line[squareIdx]++ if lines[lineIdx + 1]?[squareIdx + 1] is '*'
        line[squareIdx]++ if lines[lineIdx - 1]?[squareIdx + 1] is '*'
        
        line[squareIdx]++ if lines[lineIdx + 1]?[squareIdx - 1] is '*'
        line[squareIdx]++ if lines[lineIdx - 1]?[squareIdx - 1] is '*'
        
    return lines.join('\n').replace(/\,/g, '')