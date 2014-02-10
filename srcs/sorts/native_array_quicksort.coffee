###
  recursive based sort

  base case -> if the array has one or zero item , it's considered as sorted
  recursive case ->
    1. choose a pivot ( here, the middle of the array )
    2. make two empty arrays 'smaller' and 'greater'
      2.1 iterate through tab and everything lower than the pivot go to smaller, the rest go to greather
    3. return a concatenation of quicksort smaller + pivot + quicksort greater
###

native_array_quick_sort = (arr) ->
  return arr if arr.length <= 1

  pivot   = arr.splice((Math.floor arr.length / 2), 1)
  greater = []
  smaller = []

  for i in arr
    if i <= pivot then smaller.push i else greater.push i

  return native_array_quick_sort(smaller).concat(pivot, native_array_quick_sort(greater))

module.exports = native_array_quick_sort