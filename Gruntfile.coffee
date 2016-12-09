'use strict'

module.exports = (grunt) ->
  require('time-grunt') grunt
  require('load-grunt-tasks') grunt

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    mocha_istanbul:
      coverage:
        src: 'test/unit/'
        options:
          require: ['test/unit/mocha-setup']
          mask: '**/*Spec.coffee'
          reportFormats: [
            'lcov'
          ]
          reporter: 'xunit-file'
          dryRun: false
          scriptPath: require.resolve('ibrik/lib/command')
          mochaOptions: [
            '--compilers'
            'coffee:ibrik/node_modules/coffee-script/register'
            '--recursive'
          ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-mocha-istanbul'

  grunt.registerTask 'test-task', 'run a test', ->
    grunt.log.write('Logging some stuff...').ok()
    return

  grunt.registerTask 'test', 'mocha_istanbul:coverage'
  grunt.registerTask 'default', [ 'test-task' ]

  return

