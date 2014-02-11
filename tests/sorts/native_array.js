// Generated by CoffeeScript 1.6.3
var assert, native_array_insertion_sort, native_array_merge_sort, native_array_quick_sort, should;

assert = require('assert');

should = require('should');

native_array_quick_sort = require('./../../srcs/sorts/native_array_quicksort');

native_array_merge_sort = require('./../../srcs/sorts/native_array_mergesort');

native_array_insertion_sort = require('./../../srcs/sorts/native_array_insertion_sort');

describe("Sorts (on 10k elements)", function() {
  var generated_array, generated_sorted_array, i, sorted_array, to_sort, _i;
  generated_array = [];
  for (i = _i = 0; _i <= 10000; i = ++_i) {
    generated_array.push(Math.floor(Math.random() * 150));
  }
  generated_sorted_array = generated_array.slice().sort(function(a, b) {
    return a - b;
  });
  sorted_array = [];
  to_sort = [];
  beforeEach(function() {
    to_sort = generated_array.slice();
    return sorted_array = generated_sorted_array.slice();
  });
  describe("quickSort", function() {
    it("#native_array_quick_sort() should sort an array successfully", function() {
      return native_array_quick_sort(to_sort).should.be.eql(sorted_array);
    });
    it("#native_array_quick_sort() should sort an already sorted array successfully", function() {
      to_sort = sorted_array.slice();
      return native_array_quick_sort(to_sort).should.be.eql(sorted_array);
    });
    return it("#native_array_quick_sort() should sort an array with one element", function() {
      return native_array_quick_sort([1]).should.be.eql([1]);
    });
  });
  describe("mergeSort", function() {
    it("#mergeSort() should should sort an array successfully", function() {
      return native_array_merge_sort(to_sort).should.be.eql(sorted_array);
    });
    it("#mergeSort() should should sort an already sort array successfully", function() {
      to_sort = sorted_array.slice();
      return native_array_merge_sort(to_sort).should.be.eql(sorted_array);
    });
    it("#mergeSort() should should sort an empty array successfully", function() {
      return native_array_merge_sort([]).should.be.eql([]);
    });
    return it("#mergeSort() should should sort an array of 1 item successfully", function() {
      return native_array_merge_sort([42]).should.be.eql([42]);
    });
  });
  return describe("insertionSort", function() {
    it("#insertionSort() should should sort an array successfully", function() {
      return native_array_insertion_sort(to_sort).should.be.eql(sorted_array);
    });
    it("#insertionSort() should should sort an array in place successfully", function() {
      native_array_insertion_sort(to_sort);
      return to_sort.should.be.eql(sorted_array);
    });
    it("#insertionSort() should should sort an already sort array successfully", function() {
      to_sort = sorted_array.slice();
      return native_array_insertion_sort(to_sort).should.be.eql(sorted_array);
    });
    it("#insertionSort() should should sort an empty array successfully", function() {
      return native_array_insertion_sort([]).should.be.eql([]);
    });
    return it("#insertionSort() should should sort an array of 1 item successfully", function() {
      return native_array_insertion_sort([42]).should.be.eql([42]);
    });
  });
});