// Generated by CoffeeScript 1.6.3
/*
  divide and conquer merge sort
    1. divide the given array of multiple array of 1 element ( recursive case )
      -> to do that, split the array in the middle into two arrays and call merge routine on both until reaching base case
    2. return the array when array.length <= 1 ( base case )
*/

var merge_sorted_array, native_array_merge_sort;

merge_sorted_array = function(arr1, arr2) {
  var arr1_idx, arr2_idx, sorted_array;
  sorted_array = [];
  arr1_idx = 0;
  arr2_idx = 0;
  while (arr1.length > 0 && arr2.length > 0) {
    if (arr1[arr1_idx] < arr2[arr2_idx]) {
      sorted_array.push(arr1.splice(0, 1)[0]);
    } else {
      sorted_array.push(arr2.splice(0, 1)[0]);
    }
  }
  if (arr1.length === 0) {
    return sorted_array.concat(arr2);
  } else if (arr2.length === 0) {
    return sorted_array.concat(arr1);
  }
  return sorted_array;
};

native_array_merge_sort = function(arr) {
  var i, left, middle_index, right;
  if (arr.length <= 1) {
    return arr;
  }
  left = [];
  right = [];
  middle_index = Math.floor(arr.length / 2);
  i = 0;
  while (i < middle_index) {
    left.push(arr[i++]);
  }
  while (i < arr.length) {
    right.push(arr[i++]);
  }
  left = native_array_merge_sort(left);
  right = native_array_merge_sort(right);
  return merge_sorted_array(left, right);
};

module.exports = native_array_merge_sort;
