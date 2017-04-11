util = require '../../../src/utils/util'

describe 'common/utils/util', ->

  describe 'getNamespace()', ->
    it "undefined", ->
      test = undefined
      expect(util.getNamespace(test)).to.equal ''

    it 'empty -> empty', ->
      test = ''
      expect(util.getNamespace(test)).to.equal ''

    it 'happy -> /happy', ->
      test = 'happy'
      expect(util.getNamespace(test)).to.equal '/happy'

    it '/happy -> /happy', ->
      test = '/happy'
      expect(util.getNamespace(test)).to.equal '/happy'
