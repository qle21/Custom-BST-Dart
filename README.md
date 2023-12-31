# Dart Collection Library

This Dart library provides a framework for collection classes, including an abstract `Collection<T>` superclass and two concrete subclasses, `BST<T>` and `LinkedList<T>`. The library allows users to work with collections of elements of an arbitrary type `T` while ensuring no duplicate values are allowed.

## Collection<T> Class

### Abstract Methods

- `add()`: Inserts an element of type `T` into the collection. This method is defined in subclasses.

- `copy()`: Returns a deep copy of the collection. The returned collection must be of the same type as the receiver.

- `operator[]()`: Indexing operator. Returns the element at the specified index. If the index is out of bounds, an error message is printed, and an exception is thrown.

- `printString()`: Prints all elements in the collection on the console.

### Concrete Methods

- No-arg constructor.

- `map(fn)`: Applies the function `fn` to all elements in the collection and stores the values in a new collection of the same type.

- `contains(obj)`: Returns a boolean indicating whether the collection contains the specified object.

- `equals(obj)`: Returns a boolean indicating whether the receiver and the argument are logically equivalent.

### Private Data Member

- `size`: An integer representing the number of elements in the collection.

## BST<T> Class

- Implements the `Collection<T>` abstract class.

- Overrides the `copy()` method to return a deep copy of the receiver.

- Implements the indexing operator for in-order tree traversal.

## LinkedList<T> Class

- Implements the `Collection<T>` abstract class.

- Represents a traditional, singly-linked LinkedList.

## Usage

1. Import the library into your Dart project.

2. Create instances of `BST<T>` or `LinkedList<T>`.

3. Use the provided methods to manipulate and interact with the collections.

```dart
void main() {
  // Create a BST of integers
  BST<int> bst = BST<int>();

  // Add elements
  bst.add(5).add(3).add(8);

  // Copy the BST
  BST<int> copiedBST = bst.copy();

  // Print the elements in the copied BST
  copiedBST.printString();

  // Check if the BST contains a specific element
  bool containsElement = bst.contains(3);

  // Check if two BSTs are equal
  bool areEqual = bst.equals(copiedBST);
}
```

Feel free to explore and extend the library based on your specific requirements.
