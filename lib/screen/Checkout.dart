import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/Item.dart';
import '../provider/shoppingcart_provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  Widget computeCost() {
    // widget to compute the total cost
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return Text(
          "Total cost to pay: ${cart.cartTotal}"); // display the total cost
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Checkout"),
          backgroundColor: Color.fromARGB(255, 155, 211, 253)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // center the children
        children: [
          Text("Item Details"),
          getItems(context), // get the items in the cart
          Flexible(
            child: Center(),
          )
        ],
      ),
    );
  }

  Widget getItems(BuildContext context) {
    // widget to get the items in the cart
    List<Item> products = context
        .watch<ShoppingCart>()
        .cart; // get the items from the shopping cart
    return products.isEmpty // if there are no items in the cart
        ? const Text('No items to checkout!') // display a message
        : Expanded(
            // if there are items in the cart
            child: Column(
              // display the items
              children: [
                Flexible(
                  // display as flexible
                  child: ListView.builder(
                    // use a list view to display the items
                    itemCount: products.length, // get the number of items
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        // return the item's details as a list tile
                        title: Text(products[index].name),
                        trailing: Text("${products[index].price}"),
                      );
                    },
                  ),
                ),
                const Divider(
                    height: 4,
                    color: Colors
                        .black), // add a divider between the items and the total cost
                computeCost(), // display the total cost
                ElevatedButton(
                    // button to simulate payment and return to the catalog
                    onPressed: () {
                      Navigator.pushNamed(
                          context, "/"); // navigate to the catalog
                      context
                          .read<ShoppingCart>()
                          .removeAll(); // remove all items from the cart
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        // show a snackbar message
                        content: Text(" Payment successful!"),
                        duration: const Duration(
                            seconds: 1,
                            milliseconds:
                                100), // set the duration of the message
                      ));
                    },
                    child: Text("Pay now"))
              ],
            ),
          );
  }
}
