class Urls {
  static const String baseUrl =
      'https://g5-flutter-learning-path-be.onrender.com/api/v3/products';

  static String getProduct(String id) => '$baseUrl/$id';
  static String getAllProducts() => baseUrl;
  static String updateProduct(String id) => '$baseUrl/$id';
  static String deleteProduct(String id) => '$baseUrl/$id';
  static String addProduct() => baseUrl;
}
const String socketUrl = 'https://g5-flutter-learning-path-be.onrender.com';

const String baseUrlChat =
    'https://g5-flutter-learning-path-be.onrender.com/api/v3';