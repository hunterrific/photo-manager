exports.setup = (app) ->
  app.get '/api/main', defaultRes
  return

defaultRes = (req, res) ->
  res.send 200, 'happy days are here again'
  return

