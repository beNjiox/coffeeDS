class BSNode
  value: null
  left: null
  right: null

  constructor: (@value) ->

  _getChildNumbers: () ->
    return 2 if @left and @right
    if @left == null and @right == null then return 0 else return 1



module.exports = BSNode
