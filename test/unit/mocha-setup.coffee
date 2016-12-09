"use strict"

global.sinon = require 'sinon'
global.chai = require 'chai'
global.expect = require('chai').expect
require('chai').should()
global.AssertionError = require('chai').AssertionError

process.env.NODE_ENV = 'test'

