class ApiUrlConstants {
  static const String baseUrl = 'http://10.0.2.2:5008/api';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String fetchUserEndpoint = '/user/profile';
  static const String updateUserEndpoint = '/user/update';
  static const String deleteUserEndpoint = '/user/delete';

  static const String getProductsEndpoint = '/products';
  static const String getProductByIdEndpoint = '/products/{id}';
  static const String getProductByBarcodeEndpoint =
      '/products/barcode/{barcode}';
}
