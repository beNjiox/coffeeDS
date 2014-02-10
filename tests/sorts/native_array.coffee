assert                      = require('assert')
should                      = require('should')
native_array_quick_sort     = require('./../../srcs/sorts/native_array_quicksort')
native_array_merge_sort     = require('./../../srcs/sorts/native_array_mergesort')
native_array_insertion_sort = require('./../../srcs/sorts/native_array_insertion_sort')

describe "Sorts (on 10k elements)", ->

  generated_array = []
  # generate array of 10k entries with number between 0 and 150
  for i in [0..10000]
    generated_array.push Math.floor(Math.random() * 150)

  generated_sorted_array = generated_array.slice().sort (a,b) ->
    return a - b

  sorted_array = []
  to_sort      = []

  beforeEach ->
    # to don't affect the generated array
    to_sort      = generated_array.slice()
    sorted_array = generated_sorted_array.slice()

  describe "quickSort", ->

    it "#native_array_quick_sort() should sort an array successfully", ->
      native_array_quick_sort(to_sort).should.be.eql sorted_array

    it "#native_array_quick_sort() should sort an already sorted array successfully", ->
      to_sort = sorted_array.slice()
      native_array_quick_sort(to_sort).should.be.eql sorted_array

    it "#native_array_quick_sort() should sort an array with one element", ->
      native_array_quick_sort([1]).should.be.eql [1]

  describe "mergeSort", ->

    it "#mergeSort() should should sort an array successfully", ->
      native_array_merge_sort(to_sort).should.be.eql sorted_array

    it "#mergeSort() should should sort an already sort array successfully", ->
      to_sort = sorted_array.slice()
      native_array_merge_sort(to_sort).should.be.eql sorted_array

    it "#mergeSort() should should sort an empty array successfully", ->
      native_array_merge_sort([]).should.be.eql []

    it "#mergeSort() should should sort an array of 1 item successfully", ->
      native_array_merge_sort([42]).should.be.eql [42]

  describe "insertionSort", ->

    it "#insertionSort() should should sort an array successfully", ->
      native_array_insertion_sort(to_sort).should.be.eql sorted_array

    it "#insertionSort() should should sort an array in place successfully", ->
      native_array_insertion_sort(to_sort)
      to_sort.should.be.eql sorted_array

    it "#insertionSort() should should sort an already sort array successfully", ->
      to_sort = sorted_array.slice()
      native_array_insertion_sort(to_sort).should.be.eql sorted_array

    it "#insertionSort() should should sort an empty array successfully", ->
      native_array_insertion_sort([]).should.be.eql []

    it "#insertionSort() should should sort an array of 1 item successfully", ->
      native_array_insertion_sort([42]).should.be.eql [42]

