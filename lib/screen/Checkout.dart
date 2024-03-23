import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/Item.dart';
import '../provider/shoppingcart_provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  Widget computeCost() {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return Text("Total cost to pay: ${cart.cartTotal}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Checkout"),
          backgroundColor: Color.fromARGB(255, 155, 211, 253)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Item Details"),
          getItems(context),
          Flexible(
            child: Center(),
          )
        ],
      ),
    );
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    return products.isEmpty
        ? const Text('No items to checkout!')
        : Expanded(
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(products[index].name),
                        trailing: Text("${products[index].price}"),
                      );
                    },
                  ),
                ),
                const Divider(height: 4, color: Colors.black),
                computeCost(),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/");
                      context.read<ShoppingCart>().removeAll();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(" Payment successful!"),
                        duration: const Duration(seconds: 1, milliseconds: 100),
                      ));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text("Pay now"))
              ],
            ),
          );
  }
}
