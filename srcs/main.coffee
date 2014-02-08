BSTree = require('./BSTree')

tree = new BSTree()

for value in [42, 20, 10, 30, 40, 25, 50, 60, 100, 55, 53, 52]
  tree.add(value)

# console.log tree.find 40
# console.log tree.find 42

# console.log tree.contains 40
# console.log tree.contains 312321

console.log tree.height()

# console.log(tree.toString())
# tree.remove(60)
# tree.remove(100)
# tree.remove(10)
# console.log(tree.toString())
# console.log("remove 60", tree.remove(60))
# console.log(tree.toString())
# console.log(tree.toString())
# console.log(tree.remove(60))
# console.log(tree.remove(30))
# console.log(tree.remove(42))