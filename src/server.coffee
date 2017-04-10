express = require 'express'
compression = require 'compression'
favicon = require 'serve-favicon'
morgan = require 'morgan'
bodyParser = require 'body-parser'
errorhandler = require 'errorhandler'
http = require 'http'
path = require 'path'

config = require './conf/config'

process.on 'uncaughtException', (err) ->
  console.log 'uncaught exception'
  console.log err

setupExpressApp = (config) ->
  app = express()
  app.use compression()
  app.use favicon(path.join(config.get('server:docDir'), 'images/favicon.ico'))
  # morgan is a auto logger; dev is a predefined log format; also default, etc.; can customize
  # alternative is to use winston
  app.use morgan('dev')
  app.use bodyParser.urlencoded({extended: true})
  app.use bodyParser.json()
  app.use express.static(path.resolve(config.get('server:docDir')))

  if config.env.development
    app.use errorhandler(
      dumpExceptions: true
      showStack: true
    )

  return app

configureControllers = (app) ->
  ['controllers/Main'].map (controllerName) ->
    controller = require "./#{controllerName}"
    controller.setup app

configureMockControllers = (app) ->
  ['mock/Mock'].map (controllerName) ->
    controller = require "./#{controllerName}"
    controller.setup app

console.log "Starting up server in #{config.env}..."

app = module.exports = setupExpressApp(config)
server = http.createServer app

configureControllers app
configureMockControllers app

server.listen config.get('server:port'), ->
  console.log 'Express server listening on port ' + config.get('server:port')
