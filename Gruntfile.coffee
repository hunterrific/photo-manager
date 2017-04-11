'use strict'

module.exports = (grunt) ->
  require('time-grunt') grunt
  require('load-grunt-tasks') grunt

  reloadPort = 35729

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    clean:
      server:
        src: [ 'target/build/src/**/*' ]
      client:
        src: [ 'public/**/*' ]
    coffee:
      server:
        files: grunt.file.expandMapping(['src/**/*.coffee'], 'target/build/', rename: (destBase, destPath) ->
          destBase + destPath.replace(/\.coffee$/, '.js')
        )
    copy:
      app_html_js:
        files: [
          {
            expand: true
            flatten: false
            cwd: 'app-html-js/'
            src: [ '**/*' ]
            dest: 'public/'
          }
        ]
      images:
        files: [
          expand: true
          flatten: false
          cwd: 'app-images'
          src: [ '**/*' ]
          dest: 'public/images/'
        ]
    develop:
      server:
        file: 'target/build/src/server.js'
    watch:
      options:
        nospawn: true
        livereload: reloadPort
      server:
        files: [ 'src/**/*' ]
        tasks: [
          'clean:server'
          'coffee:server'
          'develop'
        ]
      html_js:
        files: [ 'app-html-js/**/*' ]
        tasks: [
          'clean:client'
          'copy'
        ]
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

  grunt.config.requires 'watch.server.files'
  files = grunt.config 'watch.server.files'
  files = grunt.file.expand(files)

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-mocha-istanbul'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.registerTask 'delayed-livereload', 'Live reload after the node server has started.', ->
    done = this.async()
    setTimeout ->
      request.get 'http:localhost:' + reloadPort + '/changed?files=' + files.join(','), (err, res) ->
        reloaded = not err? and res.statusCode is 200
        if reloaded
          grunt.log.ok 'Delayed live reload successful.'
        else
          grunt.log.error 'Unable to make a delayed live reload.'
        done reloaded
    , 500

  grunt.registerTask 'usage', 'Options when running Grunt...', ->
    grunt.log.writeln 'dev - clean, coffee, copy, develop, watch'
    grunt.log.writeln 'server - develop, watch'
    grunt.log.writeln 'test - mocha_istanbul:coverage'

  grunt.registerTask 'dev', [ 'clean', 'coffee', 'copy', 'develop', 'watch' ]
  grunt.registerTask 'server', [ 'develop', 'watch' ]
  grunt.registerTask 'test', 'mocha_istanbul:coverage'
  grunt.registerTask 'default', [ 'usage' ]

  return
