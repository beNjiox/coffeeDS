## CoffeeDS [![Build Status](https://travis-ci.org/beNjiox/coffeeDS.png?branch=master)](https://travis-ci.org/beNjiox/coffeeDS) [![Coverage Status](https://coveralls.io/repos/beNjiox/coffeeDS/badge.png?branch=master)](https://coveralls.io/r/beNjiox/coffeeDS?branch=master)

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

### Getting started

The repo makes uses of:
* [mocha](https://github.com/visionmedia/mocha) 
* [should.js](https://github.com/visionmedia/should.js)
* [istanbul](https://github.com/gotwarlost/istanbul) 
* [gulp](https://github.com/gulpjs/gulp) (with notify, coffeescript,coffeelint, exec)

Don't forget to npm install upon cloning

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

