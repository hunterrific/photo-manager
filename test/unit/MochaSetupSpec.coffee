describe "Mocha Setup Test", ->

  describe "Chai Setup", ->
    it "should ensure that chai should is included", ->
      "this".should.not.be.empty

    it "should ensure that chai expect is included", ->
      expect(true).to.be.true

