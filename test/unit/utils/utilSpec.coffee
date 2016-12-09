util = require '../../../src/utils/util'

describe "sample mocha test for util", ->

  describe "test testTrue()", ->
    it "should be true", ->
      expect(util.testTrue()).to.be.true

