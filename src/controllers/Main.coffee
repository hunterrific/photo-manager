exports.setup = (app) ->
  app.get '/api/main', defaultRes
  return

defaultRes = (req, res) ->
  res
  .status 200
  .send 'happy days are here again'
  return

