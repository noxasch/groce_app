import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';
import 'package:tfw_grocery_app/models/product.dart';
import 'package:tfw_grocery_app/widgets/cart_counter.dart';
import 'package:tfw_grocery_app/widgets/favorite_button.dart';
import 'package:tfw_grocery_app/widgets/product_price.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

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
                  child: Image.asset(product.imagePath),
                ),
                const Positioned(
                  bottom: -20.0,
                  child: CartCounter(),
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
                    product.title
                  ),
                ),
                ProductPrice(amount: product.priceString)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              product.description,
              style: const TextStyle(
                color: Color(0xFFBDBDBD),
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding * 2),
        child: MaterialButton(
          color: primaryColor,
          padding: const EdgeInsets.all(defaultPadding),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))
          ),
          onPressed: () {},
          child: Text(
            AppLocalizations.of(context)!.addToCart,
            style: const TextStyle(
              color: Colors.white
            ),
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
