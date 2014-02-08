###
BSTree API
  - clear:boolean (void)
  - isEmpty:boolean (void)

  - add:boolean (value (integer|array of integer))
  - find:BSNode (value (integer))
  - remove:boolean (value (integer))
  - contains:boolean (value (integer))
  - min:value|boolean (void)
  - max:value|boolean (void)
  - print:void (void)
  - toString:void
###

class BSTree
  _root = null

  clear: () ->
    @_root = null

  isEmpty: () ->
    return _root == null

  add: (value) ->
    console.log (value)

module.exports = BSTree