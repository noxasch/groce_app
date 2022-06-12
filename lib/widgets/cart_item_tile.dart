import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';
import 'package:tfw_grocery_app/models/product_item.dart';
import 'package:tfw_grocery_app/widgets/widgets.dart';

class CartItemTile extends StatelessWidget {
  final ProductItem productItem;

  const CartItemTile({
    Key? key,
    required this.productItem
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(productItem.product.imagePath),
      ),
      title: Text(
        productItem.product.title,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            ProductPrice(amount: productItem.product.priceString),
            Text(
              ' x ${productItem.quantity}',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      
    );
  }
}
