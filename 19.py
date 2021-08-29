class Node:
  def __init__(self, data):
    self.data = data  
    self.next = None  
class LinkedList:
  def __init__(self):
    self.head = None
  def pushNode(self, data):
    new_node = Node(data)
    if self.head is None:
        self.head = new_node
        return
    last = self.head
    while (last.next):
        last = last.next
    last.next =  new_node
  def printList(self):
    temp = self.head
    while(temp):
      print(temp.data,end="->")
      temp = temp.next
if __name__=='__main__':
  # Start with the empty list
  list = LinkedList()

  list.pushNode(1)
  list.pushNode(2)
  list.pushNode(3)
  list.printList()