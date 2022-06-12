import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfw_grocery_app/models/product_item.dart';

final cartStateProvider = StateNotifierProvider<CartState, List<ProductItem>>((ref) {
  return CartState([]);
});

class CartState extends StateNotifier<List<ProductItem>> {
  CartState(super.state);

  void addProduct(ProductItem item) {
    final int index =  state.indexWhere((i) => i.product.title == item.product.title);
    if (index != -1) {
      state.elementAt(index).increment();
    } else {
      // this is considering each item only added once
      state = [...state, item];
    }
  }
}
