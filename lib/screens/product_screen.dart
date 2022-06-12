import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';
import 'package:tfw_grocery_app/models/product.dart';
import 'package:tfw_grocery_app/models/product_item.dart';
import 'package:tfw_grocery_app/states/cart_states.dart';
import 'package:tfw_grocery_app/widgets/widgets.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String _cartTag = '';

  void _onAddToCart(BuildContext context) {
    // if added to cart, link hero animation to cart instead
    setState(() {
      _cartTag = '_cartTag';
    });
    // return to list
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none, // make sure stack doesn't get clipped
              alignment: Alignment.center, // fit available horizontal space
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xFFF8F8F8),
                  child: Hero(
                    tag: widget.product.title + _cartTag,
                    child: Image.asset(widget.product.imagePath)
                  ),
                ),
                const Positioned(
                  bottom: -20.0,
                  child: ItemCounter(),
                ),
              ],
            ),
          ),
          const SizedBox(height: defaultPadding * 1.5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.title
                  ),
                ),
                ProductPrice(amount: widget.product.priceString)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              widget.product.description,
              style: const TextStyle(
                color: Color(0xFFBDBDBD),
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding,),
          child: Consumer(
            builder: (context, ref, child) {
              return MaterialButton(
                color: primaryColor,
                padding: const EdgeInsets.all(defaultPadding),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                onPressed: () {
                  ref.read(cartStateProvider.notifier)
                    .addProduct(ProductItem(product: widget.product));

                  _onAddToCart(context);
                },
                child: Text(
                  AppLocalizations.of(context)!.addToCart,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      leading: const BackButton(
        color: Colors.black,
      ),
      title: Text(
        AppLocalizations.of(context)!.fruits,
        style: const TextStyle(color: Colors.black),
      ),
      actions: const [
        FavoriteButton(radius: 20.0,),
        SizedBox(width: defaultPadding,)
      ],
    );
  }
}
