import 'package:tfw_grocery_app/common.dart';
import 'package:tfw_grocery_app/constants.dart';
import 'package:tfw_grocery_app/controllers/home_state_controller.dart';
import 'package:tfw_grocery_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeStateController();

  void _onVerticalDrag(DragUpdateDetails details) {
    if (details.primaryDelta! < -12) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12)  {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // bottom: false,
        child: Container(
          color: const Color(0xFFEAEAEA),
          child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {  
              bool isNormal() {
                return controller.homeState == HomeState.normal;
              }

              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double maxHeight = constraints.maxHeight;

                  double _panelHeights() {
                    return constraints.maxHeight - cartBarHeight * 2 - headerHeight;
                  }

                  return Stack(
                    children: [
                      AnimatedPositioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: isNormal() ? cartBarHeight : constraints.maxHeight - cartBarHeight,
                        duration: panelTransition,
                        child: GestureDetector(
                          onVerticalDragUpdate: (details) {
                            _onVerticalDrag(details);
                            // print(details.primaryDelta);
                          },
                          child: Container(
                            height: cartBarHeight,
                            color: const Color(0xFFEAEAEA),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        top: isNormal() ? headerHeight : - _panelHeights(),
                        right: 0,
                        left: 0,
                        height: maxHeight - headerHeight - cartBarHeight,
                        duration: panelTransition,
                        child: const ProductsGrid(),
                      ),
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: isNormal() ? 0 : -headerHeight,
                        right: 0,
                        left: 0,
                        height: headerHeight,
                        child: const Header(),
                      ),
                      // Expanded(child: ProductsGrid()),
                      // SizedBox(height: cartBarHeight,),
                    ],
                  );
                }
              );
            },
            // child: LayoutBuilder(
            //   builder: (BuildContext context, BoxConstraints constraints) {
            //     double maxHeight = constraints.maxHeight;
            //     return Stack(
            //       children: [
            //         const Positioned(
            //           top: 0,
            //           right: 0,
            //           left: 0,
            //           height: headerHeight,
            //           child: Header(),
            //         ),
            //         Positioned(
            //           top: controller.homeState == HomeState.normal ? headerHeight : -500.0,
            //           right: 0,
            //           left: 0,
            //           height: maxHeight - headerHeight - cartBarHeight,
            //           child: const ProductsGrid(),
            //         ),
            //         Positioned(
            //           bottom: 0,
            //           left: 0,
            //           right: 0,
            //           height: cartBarHeight,
            //           child: GestureDetector(
            //             onVerticalDragUpdate: (details) {
            //               _onVerticalDrag(details);
            //               print(details.primaryDelta);
            //             },
            //             child: Container(
            //               height: cartBarHeight,
            //               color: Colors.red,
            //             ),
            //           ),
            //         ),
            //         // Expanded(child: ProductsGrid()),
            //         // SizedBox(height: cartBarHeight,),
            //       ],
            //     );
            //   }
            // ),
          ),
        )
      ),
    );
  }
}
