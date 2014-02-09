LLNode = require('./LLNode')

###
  LinkedList Interface
    add(item, index)
    toArray()

    clear()
    contains(item, equalsFunction)
    elementAtIndex(index)
    equals(other, equalsFunction)
    first()
    forEach(callback)
    indexOf(item, equalsFunction)
    isEmpty()
    last()
    remove(item, equalsFunction)
    removeElementAtIndex(index)
    reverse()
    size()
###

class LinkedList
    head: null

    isEmpty: ->
        @head == null

    _addToTail: (value) ->
        current = @head
        while (current.next != null)
            current = current.next
        current.next = new LLNode(value)
        return true

    _addToIndex: (value, index) ->
        new_node = new LLNode(value)
        current  = @head
        tmp      = current
        k        = 0

        while (current)
            current = current.next
            if (k++ == index - 1)
                break
            tmp = tmp.next

        if (index > k)
            return false
        tmp.next = new_node
        new_node.next = current
        return true

    _addToHead: (value) ->
        new_node = new LLNode(value)

        new_node.next = @head
        @head = new_node
        return true

    add: (value, index = null) ->
        new_node      = new LLNode(value)

        if @isEmpty()
            if index > 0
                return false;
            else
                @_addToHead value
                return true

        if (index == 0)
            @_addToHead value
        else if (index == null)
            @_addToTail value
        else
            @_addToIndex value, index

    toArray: ->
        node_array = []
        current    = @head
        while (current != null)
            node_array.push(current.value)
            current = current.next
        return node_array


module.exports = LinkedList;