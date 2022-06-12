import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfw_grocery_app/screens/home_screen.dart';
import 'common.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), //ProductScreen(product: dummyProducts.first), //HomeScreen()
    );
  }
}
