// lib/core/routes.dart
import 'package:flutter/material.dart';
import 'package:tbe/HomeScreen.dart';

class Routes {
  static const String home = '/';
  static const String productDetail = '/product-detail';
  static const String cart = '/cart';

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      // case productDetail:
      //   final productId = settings.arguments as int;
      //   return MaterialPageRoute(
      //     builder: (_) => ProductDetailScreen(productId: productId),
      //   );
      // case cart:
      //   return MaterialPageRoute(builder: (_) => CartScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
