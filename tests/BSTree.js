// Generated by CoffeeScript 1.6.3
var BSTree, assert, buckets, should, t;

assert = require('assert');

BSTree = require('../srcs/BSTree');

buckets = require('./buckets');

should = require('should');

t = new buckets.BSTree;

describe('BSTree', function() {
  var bucket_tree, fill_trees, fixture_array, tree;
  tree = null;
  bucket_tree = null;
  fixture_array = [42, 20, 10, 30, 40, 25, 50, 60, 100, 55, 53, 52, 110];
  fill_trees = function() {
    var value, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = fixture_array.length; _i < _len; _i++) {
      value = fixture_array[_i];
      bucket_tree.add(value);
      _results.push(tree.add(value));
    }
    return _results;
  };
  beforeEach(function() {
    tree = new BSTree;
    return bucket_tree = new buckets.BSTree;
  });
  it('#isEmpty() should return true if empty', function() {
    assert(tree.isEmpty);
    return tree.isEmpty().should.be.exactly(bucket_tree.isEmpty());
  });
  it("#size() should handle empty trees", function() {
    tree.size().should.be.eql(0);
    return tree.size().should.be.eql(bucket_tree.size());
  });
  it("#size() should count number of items", function() {
    fill_trees();
    tree.size().should.be.eql(fixture_array.length);
    return tree.size().should.be.eql(bucket_tree.size());
  });
  it("#height() should handle empty trees", function() {
    tree.height().should.be.eql(-1);
    return tree.height().should.be.eql(bucket_tree.height());
  });
  it("#height() should count number of link between root and furthest leaf", function() {
    fill_trees();
    return tree.height().should.be.eql(bucket_tree.height());
  });
  it('#add() should add an element in the tree correctly when empty', function() {
    fill_trees();
    tree.isEmpty().should.be.exactly(bucket_tree.isEmpty());
    return tree.size().should.be.exactly(bucket_tree.size());
  });
  it("#find() should return false if doesnt find value on filled tree", function() {
    fill_trees();
    return tree.find(4242).should.be["false"];
  });
  it("#find() should return false if doesnt find value on empty tree", function() {
    return tree.find(4242).should.be["false"];
  });
  it("#contains() should return true when the value is in the tree", function() {
    fill_trees();
    tree.contains(42).should.be["true"];
    tree.contains(100).should.be["true"];
    tree.contains(55).should.be["true"];
    tree.contains(40).should.be["true"];
    tree.contains(2131).should.be["false"];
    tree.contains(42).should.be.exactly(bucket_tree.contains(42));
    return tree.contains(2131).should.be.exactly(bucket_tree.contains(2131));
  });
  it("#toArray() should return an array with node values (inOrder)", function() {
    var sorted_array;
    fill_trees();
    sorted_array = fixture_array.sort(function(a, b) {
      return a - b;
    });
    return sorted_array.should.eql(tree.toArray());
  });
  it("#max() should return the node with the highest value", function() {
    fill_trees();
    tree.max().value.should.eql(110);
    return tree.max().value.should.eql(bucket_tree.maximum());
  });
  it("#max() should return false on empty tree", function() {
    return tree.max().should.be["false"];
  });
  it("#min() should return false on empty tree", function() {
    return tree.min().should.be["false"];
  });
  it("#min() should return the node with the highest value", function() {
    fill_trees();
    tree.min().value.should.eql(10);
    return tree.min().value.should.eql(bucket_tree.minimum());
  });
  it("#remove() should handle removing when node to delete is a leaf", function() {
    var sorted_array;
    fill_trees();
    tree.remove(100);
    sorted_array = [42, 20, 10, 30, 40, 25, 50, 60, 55, 53, 52, 110].sort(function(a, b) {
      return a - b;
    });
    return sorted_array.should.eql(tree.toArray());
  });
  it("#remove() should handle removing when node to delete has one child (on the right)", function() {
    var sorted_array;
    fill_trees();
    tree.remove(110);
    sorted_array = [42, 20, 10, 30, 40, 25, 50, 60, 100, 55, 53, 52].sort(function(a, b) {
      return a - b;
    });
    return sorted_array.should.eql(tree.toArray());
  });
  it("#remove() should handle removing when node to delete has one child (on the left)", function() {
    var sorted_array;
    fill_trees();
    tree.remove(53);
    sorted_array = [42, 20, 10, 30, 40, 25, 50, 60, 100, 55, 52, 110].sort(function(a, b) {
      return a - b;
    });
    return sorted_array.should.eql(tree.toArray());
  });
  it("#remove() should handle removing when node to delete has two childrens", function() {
    var sorted_array;
    fill_trees();
    tree.remove(60);
    sorted_array = [42, 20, 10, 30, 40, 25, 50, 100, 55, 53, 52, 110].sort(function(a, b) {
      return a - b;
    });
    return sorted_array.should.eql(tree.toArray());
  });
  it("#remove() should handle removing when node to delete is the root", function() {
    var sorted_array;
    fill_trees();
    tree.remove(42);
    sorted_array = [20, 10, 30, 40, 25, 50, 60, 100, 55, 53, 52, 110].sort(function(a, b) {
      return a - b;
    });
    return sorted_array.should.eql(tree.toArray());
  });
  return it("#remove() should handle removing empty tree", function() {
    return tree.remove(42).should.be["false"];
  });
});
