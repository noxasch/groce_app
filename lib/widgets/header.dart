import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';

class Header extends StatelessWidget {
  final String username = 'Caesar Rincon';

  const Header({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      color: Colors.white,
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.goodMorning,
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                username,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black54),
              ),
            ],
          ),
          const CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('$imageAssetsRoot/profile.png'),
          )
        ],
      ),
    );
  }
}
