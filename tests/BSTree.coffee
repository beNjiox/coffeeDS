assert = require('assert')
BSTree = require('../srcs/BSTree')
buckets = require('./buckets')

t = new buckets.BSTree

describe 'BSTree', ->

  tree        = new BSTree
  bucket_tree = new buckets.BSTree

  beforeEach ->

  it '#isEmpty() should return true if empty', ->
    assert tree.isEmpty
    assert.strictEqual tree.isEmpty(), bucket_tree.isEmpty()
