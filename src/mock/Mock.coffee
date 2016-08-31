exports.setup = (app) ->
  app.get '/test/main', defaultRes
  return

defaultRes = (req, res) ->
  res.send 200, 'mocking happy days are here again'
  return

