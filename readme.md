## CoffeeDS

Basic Datastructure in CoffeeScripts.

Unit tested against the awesome [buckets](https://github.com/mauriciosantos/buckets/) lib.

### Structure covered so far:


* [Binary Search Trees](https://github.com/beNjiox/coffeeDS/wiki/Binary-Search-Tree-API)
* [Linked Lists](https://github.com/beNjiox/coffeeDS/wiki/LinkedList-api)

### Incoming


* red black trees & AVL
* stack
* heap
* hashMap
* and other stuff like sorts, generic search (A* etc)

### Why ?

No specific reasons, I'm just having some fun rediscovering all that things and thought it could be fun to share with people.
It's also a good way to test new greats tools like istanbul or gulp and enjoy the power of coffeescript! 

*Note that I don't consider this as a production ready library, even though it has been fully tested.*

### Getting started

The repo makes uses of:
* [mocha](https://github.com/visionmedia/mocha) 
* [should.js](https://github.com/visionmedia/should.js)
* [istanbul](https://github.com/gotwarlost/istanbul) 
* [gulp](https://github.com/gulpjs/gulp) (with notify, coffeescript,coffeelint, exec)

Don't forget to npm install upon cloning

*Current Coverage: 88%*

### Usage Example

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

