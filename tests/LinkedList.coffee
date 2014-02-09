assert     = require ('assert')
LinkedList = require ('../srcs/LinkedList')
buckets    = require('./buckets')
should     = require('should')

describe 'LinkedList', ->

  ll            = new LinkedList
  bucket_ll     = new buckets.LinkedList();
  fixture_array = [42, 20, 10, 30, 40, 25, 50, 60, 100, 55, 53, 52, 110]

  fill_list = ->
    for value in fixture_array
      bucket_ll.add(value, 0)
      ll.add(value, 0)

  beforeEach ->
    ll           = new LinkedList
    bucket_ll    = new buckets.LinkedList

  it "#isEmpty() should return true when head is null", ->
    ll.isEmpty().should.be.true
    ll.isEmpty().should.be.eql bucket_ll.isEmpty()

  it "#isEmpty() should return false when list filled", ->
    fill_list()

    ll.isEmpty().should.be.false
    ll.isEmpty().should.be.eql bucket_ll.isEmpty()

  it "#add() should create first node when nothing in list", ->
    ll.add(42)
    ll.isEmpty().should.be.false

  it "#add() should add to the end when no index specified", ->
    fill_list()
    ll.add(88)
    bucket_ll.add(88)

    ll.toArray().should.be.eql bucket_ll.toArray()

  it "#add() should add to the begining when index = 0", ->
    fill_list()
    ll.add(88, 0)
    bucket_ll.add(88, 0)

    ll.toArray().should.be.eql bucket_ll.toArray()

  it "#add() should add to the index specified", ->
    fill_list()
    ll.add(88, 4)
    bucket_ll.add(88, 4)

    ll.toArray().should.be.eql bucket_ll.toArray()

  it "#add() should return false if the index is out of bound", ->
    fill_list()
    ll.add(88, 100)
    bucket_ll.add(88, 100)

    ll.toArray().should.be.eql bucket_ll.toArray()






