BSTree     = require('./BSTree')
LinkedList = require('./LinkedList')
buckets    = require('../tests/buckets')

tree = new BSTree()
ll   = new LinkedList()
b_ll = new buckets.LinkedList()

for value in [1,2,3]
  tree.add(value)
  ll.add(value)
  b_ll.add(value)


# console.log (ll.size())
# console.log (ll.size(true))
# ll.add(876, 13)
# console.log (ll.size())
# console.log (ll.size(true))

# console.log(ll.elementAtIndex(0))
# console.log(ll.elementAtIndex(4))
# console.log(b_ll.elementAtIndex(4))

# console.log(ll.elementAtIndex(10))
# console.log(b_ll.elementAtIndex(10))

# console.log(ll.elementAtIndex(100))
# console.log(b_ll.elementAtIndex(100))

# console.log ll.contains(25)
# console.log ll.indexOf(25)

# sum = 0
# size = 0
# ll.forEach (elem) ->
#   sum += elem.value
#   size++
# console.log sum, size

# console.log ll.toString()
# console.log "first = #{ll.first()} <===> last = #{ll.last()}"

console.log(ll.toString())
ll.reverse()
console.log(ll.toString())