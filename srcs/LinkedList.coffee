LLNode = require('./LLNode')

###
    - add(item, index)
    - clear()
    - elementAtIndex(index)
    - size()
    - toArray()
    - contains(item, equalsFunction)
    - indexOf(item, equalsFunction)
    - isEmpty()
    - forEach(callback)
    - first()
    - last()
    - remove(item, equalsFunction)
    - removeElementAtIndex(index)
    - reverse()

    todo:
       - equals(other, equalsFunction)
       - sum
       - merge
       - half
###

class LinkedList
    head: null
    _size: 0

    # return -1 if not found
    indexOf: (value) ->
        current = @head
        k = 0
        while current
            return k if current.value == value
            current = current.next
            k++
        return -1

    contains: (value) ->
        return @indexOf(value) != -1

    _nodeAtIndex: (index) ->
        current = @head
        i = 0
        while i < index
            current = current.next
            i++
        return current

    elementAtIndex: (index) ->
        if (index > @_size || index < 0)
            return undefined

        node = @_nodeAtIndex index
        return node.value

    clear: ->
        @head = null

    isEmpty: ->
        @head == null

    size: (traverse = false) ->
        return @_size if traverse = true

        @_size = 0
        @forEach (elem) ->
            @_size++
        return @_size

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
            if index > 0 then return false else @_addToHead value
        else
            if (index == 0)
                @_addToHead value
            else if (index == null)
                @_addToTail value
            else
                @_addToIndex value, index

        @_size++

    toArray: ->
        node_array = []

        @forEach (elm) ->
            node_array.push elm.value
        return node_array

    toString: ->
        if @isEmpty() then return "" else return @toArray().toString()

    forEach: (cb) ->
        current = @head

        while current
            cb(current)
            current = current.next

    first: ->
        if @isEmpty() then return undefined else return @head.value

    last: ->
        return undefined if @isEmpty()

        last_elem = null
        @forEach (elem) ->
            if elem.next == null then last_elem = elem
        return last_elem.value

    remove: (value) ->
        index = @indexOf(value)
        return false if index is -1
        return @removeElementAtIndex index

    removeElementAtIndex: (index) ->
        if index isnt 0
            node = @_nodeAtIndex index - 1
            node.next = node.next.next
        else
            @head = @head.next
        @_size--

    reverse: ->
        current = @head
        cursor  = null
        next    = @head;
        while (current)
            next         = current.next
            current.next = cursor
            cursor       = current
            current      = next
        @head = cursor

module.exports = LinkedList;