BSNode = require('./BSNode')

###
BSTree API
  - clear:boolean (void)
  - isEmpty:boolean (void)
  - add:boolean (value (integer|array of integer))
  - find:BSNode (value (integer))
  - contains:boolean (value (integer))
  - toArray:void (void)
  - toString:void
  - min:value|boolean (void)
  - max:value|boolean (void)

  - remove:boolean (value (integer))
###

class BSTree
  _root: null

  clear: () ->
    @_root = null

  isEmpty: () ->
    return @_root == null

  traverseInOrder: (cb) ->
    return false if @isEmpty()
    @_traverseInOrder(@_root, cb)

  _traverseInOrder: (node, cb) ->
    if (node == null)
      return
    @_traverseInOrder(node.left, cb)
    cb(node)
    @_traverseInOrder(node.right, cb)

  size: () ->
    size = 0
    @traverseInOrder ->
      size++
    return size

  ###
    The height is the number of link between the root and the farest leaf
  ###
  height: () ->
    return -1 if @isEmpty()

    @_height(@_root)

  _height: (node) ->
    if (node == null)
      return -1

    return Math.max(@_height(node.left), @_height(node.right)) + 1

  add: (value) ->
    return @_root = new BSNode(value) if @isEmpty()
    current = @_root

    while (true)
      if value < current.value
        if current.left == null
          current.left = new BSNode(value)
          break
        else
          current = current.left
      else if value > current.value
        if current.right == null
          current.right = new BSNode(value)
          break
        else
          current = current.right
      else
        break

  find: (value) ->
    return false if @isEmpty() == true

    current = @_root
    while (current isnt null and current.value isnt value)
      if value < current.value
        current = current.left
      else
        current = current.right
    if current is null then return false else return current

  contains: (value) ->
    @find(value) != false

  toArray: ->
    nodeArray = []
    @traverseInOrder (node) ->
      nodeArray.push node.value
    return nodeArray

  toString: ->
    nodeArray = @toArray()
    return nodeArray.toString()

  min: ->
    return false if @isEmpty()

    current = @_root
    while (current.left != null)
      current = current.left
    return current

  max: ->
    return false if @isEmpty()

    current = @_root
    while (current.right != null)
      current = current.right
    return current

  remove: (value) ->
    return false if @isEmpty()

    return @_remove @_root, value

  _find_parent: (node, value) ->
    if (node == null)
      return false

    while (node != null)
      if value < node.value
        if value == node.left.value
          return node
        else
          node = node.left
      else
        if value == node.right.value
          return node
        else
          node = node.right

    return false

  _find_leftmost: (node) ->
    while (node.left != null)
      node = node.left
    return node

  _remove: (node, value) ->
    to_delete = @find(value)

    # we quit if the value to delete isn't in the tree
    if to_delete == false
      return false

    # the parent is necessary to rearrange the tree
    previous = @_find_parent(node, value)

    # depending on the number of child, the operation is different
    to_delete_child_numbers = to_delete._getChildNumbers()

    if to_delete_child_numbers == 0
      if previous.left and previous.left.value == to_delete.value then previous.left = null else previous.right = null
      return true
    else if to_delete_child_numbers == 1
      if to_delete.left == null then only_child = to_delete.right else only_child = to_delete.right
      if previous.left and previous.left.value == to_delete.value then previous.left = only_child else previous.right = only_child
    else
      replace         = @_find_leftmost to_delete.right
      @_remove to_delete, replace.value
      to_delete.value = replace.value
      return true


module.exports = BSTree