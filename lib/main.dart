import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/auth.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:flutter_shop/providers/orders.dart';
import 'package:flutter_shop/providers/products.dart';
import 'package:flutter_shop/screens/auth_screen.dart';
import 'package:flutter_shop/screens/cart_screen.dart';
import 'package:flutter_shop/screens/edit_product_screen.dart';
import 'package:flutter_shop/screens/orders_screen.dart';
import 'package:flutter_shop/screens/product_detail.dart';
import 'package:flutter_shop/screens/products_overview_screen.dart';
import 'package:flutter_shop/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //only Listeners will update with changeNotifierProvider
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            //setter approach
            create: (ctx) => Products(),
            update: (ctx, auth, previousProducts) {
              previousProducts.auth = auth.token;
              previousProducts.userIdd = auth.userId;
              return previousProducts;
            },
          ),
          ChangeNotifierProvider(
            create: (ctx) => Cart(),
          ),
          ChangeNotifierProxyProvider<Auth, Orders>(
            create: (ctx) => Orders(),
            update: (ctx, auth, previousOrders) {
              previousOrders.auth = auth.token;

              // previousOrders.userIdd = auth.userId;
              return previousOrders;
            },
          )
        ],
        //child will receive all the providers
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
                primarySwatch: Colors.purple,
                accentColor: Colors.deepOrange,
                fontFamily: 'Lato'),
            home: auth.isAuth ? ProductsOverViewScreen() : AuthScreen(),
            // ProductsOverViewScreen(),
            // home: UserProductsScreen(),
            routes: {
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              CartScren.routeName: (ctx) => CartScren(),
              OrdersScreen.routeName: (ctx) => OrdersScreen(),
              UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
              EditProductScreen.routeName: (ctx) => EditProductScreen(),
            },
          ),
        ));
  }
}
