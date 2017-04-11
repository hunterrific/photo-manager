express = require 'express'
compression = require 'compression'
favicon = require 'serve-favicon'
bodyParser = require 'body-parser'
errorhandler = require 'errorhandler'
expressWinston = require 'express-winston'
http = require 'http'
moment = require 'moment'
path = require 'path'
config = require './conf/config'
log = require './utils/log'
util = require './utils/util'

NAMESPACE = util.getNamespace config.get('namespace')
LOG_CONFIG = config.get 'log'
LOGGER = log.appLogger
TIMESTAMP_CONFIG = config.get 'timestamp'

process.on 'uncaughtException', (err) ->
  LOGGER.error 'uncaught exception',
    error: err
    timestamp: moment().format(TIMESTAMP_CONFIG.format)

setupExpressApp = (config) ->
  app = express()
  app.use compression()
  app.use favicon(path.join(config.get('server:docDir'), 'images/favicon.ico'))
  app.use bodyParser.urlencoded({extended: true})
  app.use bodyParser.json()
  app.use expressWinston.logger
    level: LOG_CONFIG.level
    transports: [
      log.winstonTransport
    ]
    meta: true
    expressFormat: true
    colorize: true
  app.use expressWinston.errorLogger
    transports: [
      log.winstonTransport
    ]
  app.use NAMESPACE, express.static(path.resolve(config.get('server:docDir')))

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

LOGGER.info "Starting up server in #{config.currentEnv}...",
  timestamp: moment().format(TIMESTAMP_CONFIG.format)

app = module.exports = setupExpressApp(config)
server = http.createServer app

configureControllers app
configureMockControllers app if config.env.development

server.listen config.get('server:port'), ->
  LOGGER.info "Express server listening on port #{config.get('server:port')}",
    port: config.get('server:port')
    timestamp: moment().format(TIMESTAMP_CONFIG.format)
