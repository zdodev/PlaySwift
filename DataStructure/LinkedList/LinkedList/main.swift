var list = LinkedList<Int>()
list.append(value: 3)
list.append(value: 4)
list.append(value: 5)

print(list)

print(list.nodeAt(index: 0)?.data)
print(list.nodeAt(index: 1)?.data)
print(list.nodeAt(index: 2)?.data)
print(list.nodeAt(index: 3)?.data)

