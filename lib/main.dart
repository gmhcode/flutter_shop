import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/products.dart';
import 'package:flutter_shop/screens/product_detail.dart';
import 'package:flutter_shop/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //only Listeners will update with changeNotifierProvider
    return ChangeNotifierProvider(
      //Products is basically an observable object
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductsOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
