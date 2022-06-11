import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';
import 'package:tfw_grocery_app/models/product.dart';
import 'package:tfw_grocery_app/widgets/product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(defaultPadding * 1.5),
          bottomRight: Radius.circular(defaultPadding * 1.5),
        ),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: defaultPadding,
          crossAxisSpacing: defaultPadding,
        ),
        itemCount: dummyProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            product: dummyProducts[index],
            onPress: () {}
          );
        }
      ),
    );
  }
}