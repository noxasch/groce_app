import 'package:tfw_grocery_app/constants.dart';

class Product {
  final String title;
  final String imagePath;
  final String priceString;
  final String description;

  Product({
    required this.title, 
    required this.imagePath,
    required this.priceString,
    required this.description,
  });
}

List<Product> dummyProducts = [
  Product(title: 'Cabbage', imagePath: '$imageAssetsRoot/img_1.png', priceString: '20.00', description: 'Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).'),
  Product(title: 'Broccoli', imagePath: '$imageAssetsRoot/img_2.png', priceString: '20.00', description: ''),
  Product(title: 'Carrot', imagePath: '$imageAssetsRoot/img_3.png', priceString: '20.00', description: ''),
  Product(title: 'Pakcoy', imagePath: '$imageAssetsRoot/img_4.png', priceString: '20.00', description: ''),
  Product(title: 'Cucumber', imagePath: '$imageAssetsRoot/img_1.png', priceString: '20.00', description: ''),
];
