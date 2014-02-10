assert                  = require('assert')
should                  = require('should')
native_array_quick_sort = require('./../../srcs/sorts/native_array_quicksort')
native_array_merge_sort = require('./../../srcs/sorts/native_array_mergesort')

describe "Sorts", ->
  to_sort      = [2, 21, 412, 4123, 21, 123412, 9213, 890, 42, 1230, 44433]
  sorted_array = to_sort.sort (a,b) ->
    return a - b

  beforeEach ->
    to_sort = [2, 21, 412, 4123, 21, 123412, 9213, 890, 42, 1230, 44433]

  describe "quickSort", ->

    it "#native_array_quick_sort() should sort an array successfully", ->
      native_array_quick_sort(to_sort).should.be.eql sorted_array

    it "#native_array_quick_sort() should sort an array with one element", ->
      native_array_quick_sort([1]).should.be.eql [1]

  describe "mergeSort", ->

    it "#mergeSort() should should sort an array successfully", ->
      native_array_merge_sort(to_sort).should.be.eql sorted_array

