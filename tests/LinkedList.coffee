assert     = require ('assert')
LinkedList = require ('../srcs/LinkedList')
buckets    = require('./buckets')
should     = require('should')

describe 'LinkedList', ->

  ll            = new LinkedList
  bucket_ll     = new buckets.LinkedList();
  fixture_array = [42, 20, 10, 30, 40, 25, 50, 60, 100, 55, 53, 52, 110]

  fill_lists = ->
    for value in fixture_array
      bucket_ll.add(value)
      ll.add(value)

  clear_lists = ->
    ll.clear()
    bucket_ll.clear()

  beforeEach ->
    ll           = new LinkedList
    bucket_ll    = new buckets.LinkedList
    fill_lists()

  it "#isEmpty() should return true when head is null", ->
    clear_lists()
    ll.isEmpty().should.be.true
    ll.isEmpty().should.be.eql bucket_ll.isEmpty()

  it "#isEmpty() should return false when list filled", ->
    ll.isEmpty().should.be.false
    ll.isEmpty().should.be.eql bucket_ll.isEmpty()

  it "#add() should create first node when nothing in list", ->
    ll.clear()
    ll.add(42)
    ll.isEmpty().should.be.false

  it "#add() should add to the end when no index specified", ->
    ll.add(88)
    bucket_ll.add(88)

    ll.toArray().should.be.eql bucket_ll.toArray()

  it "#add() should add to the begining when index = 0", ->
    ll.add(88, 0)
    bucket_ll.add(88, 0)

    ll.toArray().should.be.eql bucket_ll.toArray()

  it "#add() should add to the index specified", ->
    ll.add(88, 4)
    bucket_ll.add(88, 4)

    ll.toArray().should.be.eql bucket_ll.toArray()

  it "#add() should return false if the index is out of bound", ->
    ll.add(88, 100)
    bucket_ll.add(88, 100)

    ll.toArray().should.be.eql bucket_ll.toArray()

  it "#clear() should reset the list", ->
    ll.clear()
    ll.isEmpty().should.be.true

  it "#elementAtIndex() should return false when index < 0", ->
    assert ll.elementAtIndex(-5) == undefined

  it "#elementAtIndex() should return false when index > size()", ->
    assert ll.elementAtIndex(500) == undefined

  it "#elementAtIndex() should return the value for the node at the given index", ->
    ll.elementAtIndex(4).should.be.eql(40)
    ll.elementAtIndex(4).should.be.eql bucket_ll.elementAtIndex(4)

  it "#indexOf() should return index of given element", ->
    ll.indexOf(25).should.be.eql 5
    ll.indexOf(25).should.be.eql bucket_ll.indexOf(25)

  it "#indexOf() should return -1 when element doesn't exist", ->
    ll.indexOf(231325).should.be.eql -1
    ll.indexOf(25).should.be.eql bucket_ll.indexOf(25)

  it "#contains() should return false when element doesn't exist", ->
    ll.contains(450).should.be.eql false
    ll.contains(450).should.be.eql bucket_ll.contains(450)

  it "#contains() should return true when element doesn't exist", ->
    ll.contains(42).should.be.eql true
    ll.contains(42).should.be.eql bucket_ll.contains(42)

  it "#first() should return first element", ->
    ll.first().should.be.eql 42
    ll.first().should.be.eql bucket_ll.first()

    ll.add(1402, 0)
    bucket_ll.add(1402, 0)
    ll.first().should.be.eql 1402
    ll.first().should.be.eql bucket_ll.first()

  it "#first() should return undefined if empty list", ->
    clear_lists()

    assert ll.first() == undefined
    assert bucket_ll.first() == undefined

  it "#last() should return last element", ->
    ll.last().should.be.eql 110
    ll.last().should.be.eql bucket_ll.last()

    ll.add(1402)
    bucket_ll.add(1402)
    ll.last().should.be.eql 1402
    ll.last().should.be.eql bucket_ll.last()

  it "#last() should return undefined if empty list", ->
    clear_lists()

    assert ll.last() == undefined
    assert bucket_ll.last() == undefined

  it "#remove() should remove the first node successfully", ->
    ll.remove 42
    bucket_ll.remove 42

    ll.first().should.be.eql (20)
    ll.first().should.be.eql bucket_ll.first()

  it "#remove() should remove an existing value successfully", ->
    ll.remove 100
    bucket_ll.remove 100

    ll.contains(100).should.be.false
    ll.toArray().should.be.eql bucket_ll.toArray()

  it "#remove() should affect size", ->
    initial_size = ll.size()
    ll.remove 100
    bucket_ll.remove 100

    ll.size().should.be.eql initial_size - 1
    ll.size().should.be.eql bucket_ll.size()

  it "#reverse() should reverse the list", ->
    ll.reverse()
    bucket_ll.reverse()

    ll.toArray().should.be.eql bucket_ll.toArray()

  it "#reverse() should work even if empty list", ->
    clear_lists()
    ll.reverse()
    bucket_ll.reverse()

    ll.toArray().should.be.eql bucket_ll.toArray()
