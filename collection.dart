// Abstract superclass Collection<T>
abstract class Collection<T> {
  int _size = 0; // Make size private

  int get size => _size; // Public getter for size

  // Internal method to increment size
  void _incrementSize() {
    _size++;
  }

  // Abstract methods to be implemented by subclasses
  Collection<T> add(T x);
  T operator [](int i);
  Collection<T> copy();
  void printString();
  bool contains(Object obj);
  bool equals(Object obj);
  Collection<R> map<R extends Comparable<R>>(R Function(T) fn);
}

// Concrete Collection<T> subclass BST<T>
class BST<T extends Comparable<T>> extends Collection<T> {
  Node<T>? root;

  BST() : root = null;

  @override
  BST<T> add(T x) {
    root = _insertHelper(root, x);
    _incrementSize(); // Use the internal method to modify size
    return this;
  }

  @override
  T operator [](int i) {
    List<T> result = [];
    _inOrderTraversalHelper(root, result);
    if (i < 0 || i >= result.length) {
      print('Out bound');
      throw RangeError('Out bound');
    }
    return result[i];
  }

  @override
  Collection<T> copy() {
    BST<T> copyTree = BST<T>();
    _copyTreeHelper(root, copyTree);
    return copyTree;
  }

  @override
  void printString() {
    List<T> result = [];
    _inOrderTraversalHelper(root, result);
    print(result);
  }

  @override
  Collection<R> map<R extends Comparable<R>>(R Function(T) fn) {
    BST<R> resultTree = BST<R>();
    _mapTreeHelper(root, resultTree, fn);
    return resultTree;
  }

  @override
  bool contains(Object obj) {
    return _containsHelper(root, obj);
  }

  @override
  bool equals(Object obj) {
    if (identical(this, obj)) return true;
    if (obj is! BST<T>) return false;
    BST<T> other = obj;
    return _areTreesEqualHelper(root, other.root);
  }

  // Helper function to insert a value into the BST
  Node<T>? _insertHelper(Node<T>? node, T x) {
    if (node == null) {
      return Node<T>(x);
    }
    if (x.compareTo(node.data) < 0) {
      node.left = _insertHelper(node.left, x);
    } else if (x.compareTo(node.data) > 0) {
      node.right = _insertHelper(node.right, x);
    }
    return node;
  }

  // Helper function for in-order traversal of the BST
  void _inOrderTraversalHelper(Node<T>? node, List<T> result) {
    if (node != null) {
      _inOrderTraversalHelper(node.left, result);
      result.add(node.data);
      _inOrderTraversalHelper(node.right, result);
    }
  }

  // Helper function to copy the BST
  void _copyTreeHelper(Node<T>? node, BST<T> copyTree) {
    if (node != null) {
      copyTree.add(node.data);
      _copyTreeHelper(node.left, copyTree);
      _copyTreeHelper(node.right, copyTree);
    }
  }

  // Helper function to map values in the BST
  void _mapTreeHelper<R extends Comparable<R>>(
      Node<T>? node, BST<R> resultTree, R Function(T) fn) {
    if (node != null) {
      R mappedValue = fn(node.data);
      resultTree.add(mappedValue);
      _mapTreeHelper(node.left, resultTree, fn);
      _mapTreeHelper(node.right, resultTree, fn);
    }
  }

  // Helper function to check if a value is present in the BST
  bool _containsHelper(Node<T>? node, Object obj) {
    if (node == null) return false;
    if (node.data == obj) return true;
    return _containsHelper(node.left, obj) || _containsHelper(node.right, obj);
  }

  // Helper function to check if two trees are equal
  bool _areTreesEqualHelper(Node<T>? node1, Node<T>? node2) {
    if (node1 == null && node2 == null) return true;
    if (node1 == null || node2 == null) return false;
    return (node1.data == node2.data) &&
        _areTreesEqualHelper(node1.left, node2.left) &&
        _areTreesEqualHelper(node1.right, node2.right);
  }
}

// Node class for holding data in the BST
class Node<T> {
  T data;
  Node<T>? left;
  Node<T>? right;

  Node(this.data)
      : left = null,
        right = null;
}

// Concrete Collection<T> subclass LinkedList<T>
class LinkedList<T> extends Collection<T> {
  Node<T>? head;

  LinkedList() : head = null;

  @override
  LinkedList<T> add(T x) {
    Node<T> newNode = Node<T>(x);
    newNode.left = head;
    head = newNode;
    _incrementSize();
    return this;
  }

  @override
  T operator [](int i) {
    Node<T>? temp = head;
    int index = 0;
    while (temp != null) {
      if (index == i) {
        return temp.data;
      }
      temp = temp.left;
      index++;
    }
    print('Out bound');
    throw RangeError('Out bound');
  }

  @override
  Collection<T> copy() {
    LinkedList<T> copyList = LinkedList<T>();
    Node<T>? temp = head;
    while (temp != null) {
      copyList.add(temp.data);
      temp = temp.left;
    }
    // Reverse the copyList
    LinkedList<T> reversedList = LinkedList<T>();
    Node<T>? reversedTemp = copyList.head;
    while (reversedTemp != null) {
      reversedList.add(reversedTemp.data);
      reversedTemp = reversedTemp.left;
    }
    return reversedList;
  }

  @override
  void printString() {
    Node<T>? temp = head;
    List<T> result = [];
    while (temp != null) {
      result.add(temp.data);
      temp = temp.left;
    }
    print(result);
  }

  @override
  bool contains(Object obj) {
    Node<T>? temp = head;
    while (temp != null) {
      if (temp.data == obj) {
        return true;
      }
      temp = temp.left;
    }
    return false;
  }

  @override
  bool equals(Object obj) {
    if (identical(this, obj)) return true;
    if (obj is! LinkedList<T>) return false;
    LinkedList<T> other = obj;
    if (size != other.size) return false;
    Node<T>? temp1 = head;
    Node<T>? temp2 = other.head;
    while (temp1 != null && temp2 != null) {
      if (temp1.data != temp2.data) {
        return false;
      }
      temp1 = temp1.left;
      temp2 = temp2.left;
    }
    return true;
  }

  @override
  Collection<R> map<R extends Comparable<R>>(R Function(T) fn) {
    LinkedList<R> result = LinkedList<R>();
    Node<T>? temp = head;
    while (temp != null) {
      result.add(fn(temp.data));
      temp = temp.left;
    }
    return result;
  }
}