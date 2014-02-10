native_array_insertion_sort = (arr) ->
  i = 0
  while i < arr.length
    j = i
    while (j > 0 and arr[j - 1] > arr[j])
      tmp        = arr[j - 1]
      arr[j - 1] = arr[j]
      arr[j]     = tmp
      j--
    i++
  return arr

module.exports = native_array_insertion_sort
