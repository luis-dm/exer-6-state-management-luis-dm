import 'package:flutter/material.dart';
import '../model/Item.dart';
import 'package:provider/provider.dart';
import '../provider/shoppingcart_provider.dart';

class MyCatalog extends StatefulWidget {
  const MyCatalog({super.key});

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  List<Item> productsCatalog = [
    // list of products in the catalog
    Item("Shampoo", 10.00, 2),
    Item("Soap", 12, 3),
    Item("Toothpaste", 40, 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Catalog"),
        backgroundColor: Color.fromARGB(255, 155, 211, 253),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            // display the products in the catalog as a list
            return ListTile(
              // list tile for each product
              leading: const Icon(Icons.star), // add an icon
              title: Text(// display the product's name and price
                  "${productsCatalog[index].name} - ${productsCatalog[index].price}"),
              trailing: TextButton(
                // add a button to add the product to the cart
                child: const Text("Add"),
                onPressed: () {
                  // when the button is pressed
                  context.read<ShoppingCart>().addItem(
                      productsCatalog[index]); // add the product to the cart
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    // show a snackbar message to confirm that the product was added
                    content: Text("${productsCatalog[index].name} added!"),
                    duration: const Duration(seconds: 1, milliseconds: 100),
                  ));
                },
              ),
            );
          },
          itemCount: productsCatalog
              .length), // get the number of products in the catalog
      floatingActionButton: FloatingActionButton(
        // add a floating action button to navigate to the cart
        child: const Icon(Icons.shopping_cart), // add an icon
        onPressed: () {
          Navigator.pushNamed(context, "/cart"); // navigate to the cart
        },
      ),
    );
  }
}
