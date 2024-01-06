class FunitureData {
  final String name;
  final String imagePath;
  final String description;
  final String detailedDescription;

  final String price;
  final String id;

  FunitureData({
    required this.name,
    required this.id,
    required this.imagePath,
    required this.description,
    required this.detailedDescription,
    required this.price,
  });
}

class CategoryData {
  final String title;

  CategoryData({
    required this.title,
  });
}

List<CategoryData> categoryList = [
  CategoryData(title: "House"),
  CategoryData(title: "Office"),
  CategoryData(title: "Kitchen"),
  CategoryData(title: "Bedroom"),
  CategoryData(title: "Balcon"),
  CategoryData(title: "Sitting room"),
  CategoryData(title: "Shop"),
];

List<FunitureData> funitureList = [
  FunitureData(
      name: "Ancient wooden Chair ",
      imagePath: "assets/images/c1.png",
      description: 'This is a chair. This is a chair. This is a chair.',
      price: '19,999',
      id: "1",
      detailedDescription:
          'This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.'),
  FunitureData(
      name: "Hard Style Chair ",
      imagePath: "assets/images/c2.png",
      description: 'This is a chair. This is a chair. This is a chair.',
      price: '21,999',
      id: "2",
      detailedDescription:
          'This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.'),
  FunitureData(
      name: "One Person Cosy Sofa",
      imagePath: "assets/images/c3.png",
      description: 'This is a chair. This is a chair. This is a chair.',
      price: '22,999',
      id: "3",
      detailedDescription:
          'This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.'),
  FunitureData(
      name: "Blue Leather Office Chair ",
      imagePath: "assets/images/c4.png",
      description: 'This is a chair. This is a chair. This is a chair.',
      price: '38,999',
      id: "4",
      detailedDescription:
          'This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.'),
  FunitureData(
      name: "Pink Leather Office Chair ",
      imagePath: "assets/images/c5.png",
      description: 'This is a chair. This is a chair. This is a chair.',
      price: '57,999',
      id: "5",
      detailedDescription:
          'This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.'),
  FunitureData(
      name: "Black Leather Styled Office Chair ",
      imagePath: "assets/images/c6.png",
      description: 'This is a chair. This is a chair. This is a chair.',
      price: '78,999',
      id: "6",
      detailedDescription:
          'This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.'),
];
