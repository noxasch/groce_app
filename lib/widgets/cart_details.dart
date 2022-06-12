import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';
import 'package:tfw_grocery_app/models/product_item.dart';
import 'package:tfw_grocery_app/states/cart_states.dart';
import 'package:tfw_grocery_app/widgets/cart_item_tile.dart';

class CartDetails extends ConsumerWidget {
  const CartDetails({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ProductItem> cartItems = ref.watch(cartStateProvider);
    final double totalPrice = cartItems.fold(0, (previousValue, element) => previousValue + double.parse(element.product.priceString) * element.quantity);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.cart,
            style: Theme.of(context).textTheme.headline6,
          ),
          ...cartItems.map((item) => CartItemTile(productItem: item)).toList(),
          const SizedBox(height: defaultPadding,),
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: primaryColor,
              padding: const EdgeInsets.all(defaultPadding),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))
              ),
              onPressed: () {},
              child: Text(
                'Next \$$totalPrice',
                style: const TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    ); 
  }
}
