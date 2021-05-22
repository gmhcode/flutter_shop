import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/products.dart';
import 'package:flutter_shop/widgets/app_drawer.dart';
import 'package:flutter_shop/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              //...
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, i) => Column(
                  children: [
                    UserProductItem(
                      imageUrl: productsData.items[i].imageUrl,
                      title: productsData.items[i].title,
                    ),
                    Divider()
                  ],
                )),
      ),
    );
  }
}
// UserProductItem(
//           imageUrl:
//               'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//           title: "hello",
//           key: Key('asd')
