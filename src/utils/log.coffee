###
util for setting up logging config
###

winston = require 'winston'
config = require '../conf/config'

LOG_CONFIG = config.get 'log'

winstonTransport = new (winston.transports.Console)()
# can add additional transports here if applicable; overload if needed

appLogger = new (winston.Logger)(
  level: LOG_CONFIG.level
  rewriters: [
    (level, msg, meta) ->
      # global log rewrite (separate from express-winston)
      return meta
  ]
  transports: [
    winstonTransport
  ]
)

module.exports.winstonTransport = winstonTransport  # make transport available to express-winston
module.exports.appLogger = appLogger  # logger for app
