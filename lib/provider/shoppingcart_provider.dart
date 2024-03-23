import 'package:flutter/material.dart';
import '../model/Item.dart';

class ShoppingCart with ChangeNotifier {
  final List<Item> _shoppingList = []; // list of items in the cart
  double cartTotal = 0; // total cost of the items in the cart
  List<Item> get cart => _shoppingList; // getter for the list of items

  void addItem(Item item) {
    // method to add an item to the cart
    _shoppingList.add(item); // add the item to the list
    cartTotal = cartTotal +
        item.price; // update the total cost based on the item's price
    notifyListeners(); // notify listeners of the change
  }

  void removeAll() {
    // method to remove all items from the cart
    _shoppingList.clear(); // clear the list
    cartTotal = 0; // reset the total cost
    notifyListeners(); // notify listeners of the change
  }

  void removeItem(String name) {
    // method to remove an item from the cart
    for (int i = 0; i < _shoppingList.length; i++) {
      // iterate through the list of items
      if (_shoppingList[i].name == name) {
        // if the item matches the name
        cartTotal = cartTotal - _shoppingList[i].price; // update the total cost
        _shoppingList.remove(_shoppingList[i]); // remove the item from the list
        break; // break out of the loop
      }
    }
    notifyListeners(); // notify listeners of the change
  }
}
