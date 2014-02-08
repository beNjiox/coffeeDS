assert  = require('assert')
BSTree  = require('../srcs/BSTree')
buckets = require('./buckets')
should  = require('should')

t = new buckets.BSTree

describe 'BSTree', ->

  tree          = null
  bucket_tree   = null
  fixture_array = [42, 20, 10, 30, 40, 25, 50, 60, 100, 55, 53, 52, 110]

  fill_trees = ->
    for value in fixture_array
      bucket_tree.add(value)
      tree.add(value)

  beforeEach ->
    tree           = new BSTree
    bucket_tree    = new buckets.BSTree

  it '#isEmpty() should return true if empty', ->
    assert tree.isEmpty
    tree.isEmpty().should.be.exactly bucket_tree.isEmpty()

  it "#size() should handle empty trees", ->
    tree.size().should.be.eql(0)
    tree.size().should.be.eql(bucket_tree.size())

  it "#size() should count number of items", ->
    fill_trees()

    tree.size().should.be.eql(fixture_array.length)
    tree.size().should.be.eql(bucket_tree.size())

  it "#height() should handle empty trees", ->
    tree.height().should.be.eql(-1)
    tree.height().should.be.eql(bucket_tree.height())

  it "#height() should count number of link between root and furthest leaf", ->
    fill_trees()

    tree.height().should.be.eql(bucket_tree.height())

  it '#add() should add an element in the tree correctly when empty', ->
    fill_trees()

    tree.isEmpty().should.be.exactly bucket_tree.isEmpty()
    tree.size().should.be.exactly bucket_tree.size()

  it "#find() should return false if doesnt find value on filled tree", ->
    fill_trees()

    tree.find(4242).should.be.false

  it "#find() should return false if doesnt find value on empty tree", ->
    tree.find(4242).should.be.false

  it "#contains() should return true when the value is in the tree", ->
    fill_trees()

    tree.contains(42).should.be.true
    tree.contains(100).should.be.true
    tree.contains(55).should.be.true
    tree.contains(40).should.be.true
    tree.contains(2131).should.be.false

    tree.contains(42).should.be.exactly bucket_tree.contains(42)
    tree.contains(2131).should.be.exactly bucket_tree.contains(2131)

  it "#toArray() should return an array with node values (inOrder)", ->
    fill_trees()

    sorted_array = fixture_array
      .sort (a,b) ->
        return a - b

    sorted_array.should.eql tree.toArray()

  it "#max() should return the node with the highest value", ->
    fill_trees()

    tree.max().value.should.eql 110
    tree.max().value.should.eql bucket_tree.maximum()

  it "#max() should return false on empty tree", ->
    tree.max().should.be.false

  it "#min() should return false on empty tree", ->
    tree.min().should.be.false

  it "#min() should return the node with the highest value", ->
    fill_trees()

    tree.min().value.should.eql 10
    tree.min().value.should.eql bucket_tree.minimum()

  it "#remove() should handle removing when node to delete is a leaf", ->
    fill_trees()
    tree.remove(100)

    sorted_array = [42, 20, 10, 30, 40, 25, 50, 60, 55, 53, 52, 110]
      .sort (a,b) ->
        return a - b

    sorted_array.should.eql tree.toArray()

  it "#remove() should handle removing when node to delete has one child (on the right)", ->
    fill_trees()
    tree.remove(110)

    sorted_array = [42, 20, 10, 30, 40, 25, 50, 60, 100, 55, 53, 52]
      .sort (a,b) ->
        return a - b

    sorted_array.should.eql tree.toArray()

  it "#remove() should handle removing when node to delete has one child (on the left)", ->
    fill_trees()
    tree.remove(53)

    sorted_array = [42, 20, 10, 30, 40, 25, 50, 60, 100, 55, 52, 110]
      .sort (a,b) ->
        return a - b

    sorted_array.should.eql tree.toArray()

  it "#remove() should handle removing when node to delete has two childrens", ->
    fill_trees()
    tree.remove(60)

    sorted_array = [42, 20, 10, 30, 40, 25, 50, 100, 55, 53, 52, 110]
      .sort (a,b) ->
        return a - b

    sorted_array.should.eql tree.toArray()

  it "#remove() should handle removing when node to delete is the root", ->
    fill_trees()
    tree.remove(42)

    sorted_array = [20, 10, 30, 40, 25, 50, 60, 100, 55, 53, 52, 110]
      .sort (a,b) ->
        return a - b

    sorted_array.should.eql tree.toArray()

  it "#remove() should handle removing empty tree", ->
    tree.remove(42).should.be.false

