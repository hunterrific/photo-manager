require 'simple-errors'
path = require 'path'
nconf = require 'nconf'

currentEnv = process.env.NODE_ENV or 'development'
env = 
  production: false
  staging: false
  testing: false
  development: false

env[currentEnv] = true
# TODO: change if to elvis operator
userhome = process.env[(if (process.platform is 'win32') then 'USERPROFILE' else 'HOME')]

nconf
.overrides(
  appName: 'photo-manager'
  env: env
)
.argv()
.env()
.file(path.resolve('conf', 'defaults.conf'))
.defaults
  server:
    ip: '127.0.0.1'
    port: 3333
    docDir: './public'
    cookieKey: 'cookieKey'

module.exports = nconf
module.exports.env = env
module.exports.currentEnv = currentEnv

