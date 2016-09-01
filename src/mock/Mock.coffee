exports.setup = (app) ->
  app.get '/test/main', defaultRes
  return

defaultRes = (req, res) ->
  res
  .status 200
  .send 'mocking happy days are here again'
  return

