import 'package:tfw_grocery_app/models/product.dart';

class ProductItem {
  int quantity;
  final Product product;

  ProductItem({
    this.quantity = 1,
    required this.product,
  });

  void increment() {
    quantity++;
  }

  // void add() {}
  // void subtract() {}
}
