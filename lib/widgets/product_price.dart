import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';

class ProductPrice extends StatelessWidget {
  final String amount;

  const ProductPrice({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '\$',
        style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
        children: [
          TextSpan(
            text: amount,
            style: const TextStyle(color: Colors.black),
          ),
          const TextSpan(
            text: '/kg',
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.normal),
          )
        ]
      )
    );
  }
}
