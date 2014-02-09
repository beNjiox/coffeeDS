## CoffeeDS

Basic Datastructure in CoffeeScripts.

Unit tested against the awesome [buckets](https://github.com/mauriciosantos/buckets/) lib.

Data structure covered so far:
------------------------------

*BSTree, with the following API*
>* insert
>* remove
>* find
>* contains
>* size
>* height
>* clear
>* isEmpty
>* isLeaf
>* childs
>* min
>* max
>* print
>* toArray
>* toString

*LinkedList (simple)*

>* add(item, index)
>* clear()
>* elementAtIndex(index)
>* size()
>* toArray()
>* contains(item, equalsFunction)
>* indexOf(item, equalsFunction)
>* isEmpty()
>* forEach(callback)
>* first()
>* last()
>* remove(item, equalsFunction)
>* removeElementAtIndex(index)
>* reverse()
>* half()

# Incoming DS

>* red black trees & AVL
>* stack
>* heap
>* hashMap

then
>* sorts
>* recursions basics
>* etc


# Getting started

```
$ git clone http://github.com/beNjiox/coffeeDS
$ cd coffeeDS
$ gulp tests
```

Current Coverage: 100%

# Usage Example

```
  BSTree = require('./BSTree')
  
  tree = new BSTree()
  tree.add [100, 42, 45, 70, 120, 48]
  console.log tree.size(), tree.height()
```
