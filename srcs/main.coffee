BSTree     = require('./BSTree')
LinkedList = require('./LinkedList')
buckets    = require('../tests/buckets')

tree = new BSTree()
ll   = new LinkedList()
b_ll = new buckets.LinkedList()

for value in [42, 20, 10, 30, 40, 25, 50, 60, 100, 55, 53, 52]
  tree.add(value)
  ll.add(value)
  b_ll.add(value)


# console.log (ll.size())
# console.log (ll.size(true))
# ll.add(876, 13)
# console.log (ll.size())
# console.log (ll.size(true))

# console.log(ll.elementAtIndex(0))
console.log(ll.elementAtIndex(4))
console.log(b_ll.elementAtIndex(4))

console.log(ll.elementAtIndex(10))
console.log(b_ll.elementAtIndex(10))

console.log(ll.elementAtIndex(100))
console.log(b_ll.elementAtIndex(100))