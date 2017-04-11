config = require '../conf/config'
util = require '../utils/util'

NAMESPACE = util.getNamespace config.get('namespace')

exports.setup = (app) ->
  app.get "#{NAMESPACE}/api/main", defaultRes
  return

defaultRes = (req, res) ->
  res
  .status 200
  .send 'happy days are here again'
  return
