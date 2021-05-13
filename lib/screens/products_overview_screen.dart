import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/products_grid.dart';

class ProductsOverViewScreen extends StatelessWidget {
  // final List<Product> loadedProducts =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: ProductsGrid(),
    );
  }
}
