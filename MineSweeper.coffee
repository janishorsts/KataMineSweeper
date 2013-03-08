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
      
      {input: "*.\n..",  output: "*1\n11"}
      {input: "**\n..",  output: "**\n22"}
      {input: "..\n*.",  output: "11\n*1"}
      {input: "..\n**",  output: "22\n**"}
      {input: "..\n.*",  output: "11\n1*"}
      
      {input: ".*\n.*",  output: "2*\n2*"}
      {input: "*.\n*.",  output: "*2\n*2"}
      {input: ".*\n.*",  output: "2*\n2*"}
      {input: "*.\n.*",  output: "*2\n2*"}
      {input: ".*\n*.",  output: "2*\n*2"}
      {input: "*...\n....\n.*..\n....", output: "*100\n2210\n1*10\n1110"}

      {input: "*.\n..\n.*",  output: "*1\n22\n1*"}
      
      {input: "*...\n....\n.*..\n....", output: "*100\n2210\n1*10\n1110"}
      {input: "**...\n.....\n.*...",    output: "**100\n33200\n1*100"}
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
    examples = [
      {input: '0 0',          output: ''},
      {input: '1 1\n*\n0 0',  output: 'Field #1:\n*' }
    ];

    _.each examples, (example) ->
      it "should display '#{example.output}' when input is '#{example.input}'", ->
        mineSweeper.input(example.input);
        expect(mineSweeper.run()).to.equal example.output


# CODE 

class MineSweeper
  input: ->
  run: ->
    ''

class Game
  constructor: (@options) ->
      @grid = @parse @options.input
  parse: (input) ->
      result = []
      _.each @options.input.split('\n'), (row) ->
        result.push row.replace(/\./g, '0').split ''
      result
  display: ->
    _.each @grid, (row, rowIdx) =>
      _.each row, (column, columnIdx) =>
        return if row[columnIdx] == '*'
        
        for y in [rowIdx - 1, rowIdx, rowIdx + 1]
          for x in [columnIdx - 1, columnIdx, columnIdx + 1]
            row[columnIdx]++ if @grid[y]?[x] is '*'
        
    return @grid.join('\n').replace(/\,/g, '')