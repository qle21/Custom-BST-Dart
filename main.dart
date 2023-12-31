import 'collection.dart';

void main() {
  // Create instances and test the implemented methods
  var bst = BST<num>(); // int doesn't work; use num instead
  bst.add(1).add(2).add(3);
  print(bst[0]); // should print 1

  // Test copy of BST
  var bstcopy = bst.copy();

  var linkedList = LinkedList<String>();
  linkedList.add("Hi").add("SA").add("NJI");
  print(linkedList[1]); // should print SA

  // Test additional methods
  var mappedBST = bst.map<num>((x) => x * 3);
  print(mappedBST[1]); // should print 6

  print(bst.contains(2)); // should print true
  print(bst.equals(bst.copy())); // should print true

  // Test equal and copy of LinkedList
  var emptyBST = BST<num>();
  print(emptyBST.contains(1)); // should print false

  var mappedLL = linkedList.map<num>((x) => x.length * 2);
  print(mappedLL[0]); // should print 4

  var copyLL = linkedList.copy();
  print(copyLL.equals(linkedList)); // should print true

  // Verify and print out if both original and copy of BST and LinkedList are the same
  bst.printString(); // should print 1,2,3
  linkedList.printString(); // should print NJI, SA, Hi

  bstcopy.printString();// the same as the original
  copyLL.printString();

  // Test indexing out of bounds error
  try {
    print(bst[5]); // should throw RangeError
  } catch (e) {
    print('Type: $e');
  }

  try {
    print(linkedList[3]); // should throw RangeError
  } catch (e) {
    print('Type: $e');
  }
}
