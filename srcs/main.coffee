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

console.log "ll to array ", ll.toArray()
console.log "bll to array", b_ll.toArray()

console.log (ll.add(876, 13))
console.log "ll to array ", ll.toArray()