import 'package:flutter/material.dart';
import '../model/Item.dart';
import 'package:provider/provider.dart';
import '../provider/shoppingcart_provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    // cart widget
    return Scaffold(
      appBar: AppBar(
          title: const Text("My Cart"),
          backgroundColor: Color.fromARGB(255, 155, 211, 253)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getItems(context), // get the items in the cart
          computeCost(), // compute the total cost and display it
          const Divider(
              height: 4,
              color: Colors
                  .black), // add a divider between the items and the buttons
          Flexible(
              child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                ElevatedButton(
                    // button to reset the cart
                    onPressed: () {
                      context
                          .read<ShoppingCart>()
                          .removeAll(); // remove all items from the cart
                    },
                    child: const Text("Reset")),
                ElevatedButton(
                  // button to checkout
                  onPressed: () {
                    Navigator.pushNamed(
                        context, "/checkout"); // navigate to the checkout page
                  },
                  child: const Text("Checkout"),
                ),
              ]))),
          TextButton(
            // button to return to the catalog
            child: const Text("Go back to Product Catalog"),
            onPressed: () {
              Navigator.pushNamed(
                  context, "/products"); // navigate to the catalog
            },
          ),
        ],
      ),
    );
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    String productname = "";
    return products.isEmpty
        ? const Text('No Items yet!')
        : Expanded(
            child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.food_bank),
                    title: Text(products[index].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        productname = products[index].name;
                        context.read<ShoppingCart>().removeItem(productname);

                        if (products.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("$productname removed!"),
                            duration:
                                const Duration(seconds: 1, milliseconds: 100),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Cart empty!"),
                            duration: Duration(seconds: 1, milliseconds: 100),
                          ));
                        }
                      },
                    ),
                  );
                },
              )),
            ],
          ));
  }
}

Widget computeCost() {
  return Consumer<ShoppingCart>(builder: (context, cart, child) {
    return Text("Total: ${cart.cartTotal}");
  });
}
