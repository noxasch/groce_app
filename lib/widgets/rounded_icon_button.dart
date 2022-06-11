import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final VoidCallback onPress;

  const RoundedIconButton({
    Key? key,
    required this.iconData,
    this.color = primaryColor,
    required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: const CircleBorder(),
      elevation: 0,
      color: Colors.white,
      height: 36.0,
      minWidth: 36.0,
      onPressed: onPress,
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }
}
