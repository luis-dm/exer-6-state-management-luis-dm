import 'package:flutter/material.dart';
import './screen/MyCatalog.dart';
import './screen/MyCart.dart';
import './screen/Checkout.dart';
import 'package:provider/provider.dart';
import './provider/shoppingcart_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ShoppingCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/cart': (context) => const MyCart(),
        '/products': (context) => const MyCatalog(),
        '/checkout': (context) => const Checkout(),
      },
      home: const MyCatalog(),
    );
  }
}
