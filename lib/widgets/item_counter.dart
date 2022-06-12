import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';
import 'package:tfw_grocery_app/widgets/rounded_icon_button.dart';

class ItemCounter extends StatelessWidget {
  final int count = 1;

  const ItemCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children: [
          RoundedIconButton(
            iconData: Icons.remove,
            color: Colors.black38,
            onPress: () {}
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
            child: Text(
              '$count',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
          RoundedIconButton(
            iconData: Icons.add,
            onPress: () {}
          )
        ],
      ),
    );
  }
}
