expect = require('chai').expect

describe 'MineSweeper', ->
    describe '#run()', ->
      it 'Should end when input reaches 0 0', ->
        mineSweeper = new mineSweeper
        mineSweeper.input('0 0');
        expect(mineSweeper.run()).to.equal ''

