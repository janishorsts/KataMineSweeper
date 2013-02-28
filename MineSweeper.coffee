expect = require('chai').expect

describe 'MineSweeper', ->
    describe '#run()', ->
        it 'should display "" if inputs are 0', ->
            mineSweeper = new MineSweeper(0, 0)
            expect(mineSweeper.run()).to.equal ''
