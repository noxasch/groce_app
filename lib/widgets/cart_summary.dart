import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';
import 'package:tfw_grocery_app/models/product_item.dart';
import 'package:tfw_grocery_app/states/cart_states.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Cart',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(width: defaultPadding),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Consumer(
              builder: (context, ref, child) {
                  final List<ProductItem> cartItems = ref.watch(cartStateProvider);

                  return Row(
                  children: cartItems.map((item) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding / 2),
                      child: Hero(
                        tag: '${item.product.title}_cartTag',
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage(item.product.imagePath),
                        ),
                      ) ,
                    )
                  ).toList(),
                );
              },
            ),
          )
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Consumer(
            builder: (context, ref, child) {
              final List<ProductItem> cartItems = ref.watch(cartStateProvider);

              return Text(
                '${cartItems.fold<int>(0, (previousValue, element) => previousValue + element.quantity)}',
                style: const TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
              );
            },
          ),
        )
      ],
    );
  }
}