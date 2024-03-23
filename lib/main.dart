import 'package:flutter/material.dart';
import './screen/MyCatalog.dart';
import './screen/MyCart.dart';
import './screen/Checkout.dart';
import 'package:provider/provider.dart';
import './provider/shoppingcart_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    // add shopping cart provider
    ChangeNotifierProvider(create: (context) => ShoppingCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner
      title: 'Flutter Demo', // title
      theme: ThemeData(
        // set theme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/', // set initial route
      routes: {
        // set routes for the cart, catalog, and checkout screens
        '/cart': (context) => const MyCart(),
        '/products': (context) => const MyCatalog(),
        '/checkout': (context) => const Checkout(),
      },
      home: const MyCatalog(), // set home screen
    );
  }
}
