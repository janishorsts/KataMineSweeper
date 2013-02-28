expect = require('chai').expect

describe 'MineSweeper', ->
    describe '#field()', ->
        it 'with 0 lines should not be processed', ->
            mineSweeper = new MineSweeper
            mineSweeper.field(0, 1);
            expect(mineSweeper.display()).to.equal('')
