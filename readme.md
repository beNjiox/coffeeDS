## CoffeeDS

Basic Datastructure in CoffeeScripts.

Unit tested against the awesome [buckets](https://github.com/mauriciosantos/buckets/) lib.

Data structure covered so far:
------------------------------

*BSTree, with the following API*
* insert
* remove
* find
* contains
* size
* height
* clear
* isEmpty
* isLeaf
* childs
* min
* max
* print
* toArray
* toString

*LinkedList (simple)*

* add(item, index)
* clear()
* elementAtIndex(index)
* size()
* toArray()
* contains(item, equalsFunction)
* indexOf(item, equalsFunction)
* isEmpty()
* forEach(callback)
* first()
* last()
* remove(item, equalsFunction)
* removeElementAtIndex(index)
* reverse()
* half()

# Incoming DS

* red black trees & AVL
* stack
* heap
* hashMap

then
* sorts
* etc


# Getting started

The repo makes uses of:
* [mocha](https://github.com/visionmedia/mocha) 
* [should.js](https://github.com/visionmedia/should.js)
* [istanbul](https://github.com/gotwarlost/istanbul) 
* [gulp](https://github.com/gulpjs/gulp) (with notify, coffeescript,coffeelint, exec)

Don't forget to npm install upon cloning

*Current Coverage: 88%*

# Usage Example

```
# main.coffee
BSTree = require('./BSTree')

tree = new BSTree()
tree.add [100, 42, 45, 70, 120, 48]
console.log tree.size(), tree.height()
```

```
$ git clone http://github.com/beNjiox/coffeeDS
$ cd coffeeDS && npm install
$ gulp tests
$ gulp cover && open ./coverage/lcov-report/index.html
```

