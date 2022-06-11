import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';
import 'package:tfw_grocery_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // bottom: false,
        child: Container(
          color: const Color(0xFFEAEAEA),
          child: Column(
            children: const [
              Header(),
              Expanded(child: ProductsGrid()),
              SizedBox(height: cartBarHeight,),
            ],
          ),
        )
      ),
    );
  }
}
