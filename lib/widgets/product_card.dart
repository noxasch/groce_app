import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';
import 'package:tfw_grocery_app/models/product.dart';
import 'package:tfw_grocery_app/widgets/product_price.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onPress;

  const ProductCard({
    Key? key, 
    required this.product, 
    required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: const BoxDecoration(
          color: Color(0xFFF7F7F7),
          borderRadius: BorderRadius.all(
            Radius.circular(defaultPadding * 1.25),
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: product.title,
                child: Image.asset(product.imagePath)
              ),
              Text(
                product.title,
                style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'Fruits',
                style: Theme.of(context).textTheme.caption,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductPrice(amount: product.priceString),
                ],
              )
            ],
          ),
      ),
    );
  }
}
