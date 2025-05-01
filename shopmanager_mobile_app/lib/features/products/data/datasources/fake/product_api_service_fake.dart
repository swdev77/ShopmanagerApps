import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:shopmanager_mobile_app/features/products/data/datasources/remote/product_api_service.dart';
import 'package:shopmanager_mobile_app/features/products/data/models/product_model.dart';

class ProductApiServiceFake implements ProductApiService {
  @override
  Future<HttpResponse<ProductModel>> getProductByBarcode(String barcode) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 2));

    final fakeProduct = ProductModel(
      id: 1,
      type: 'Fake Type',
      brand: 'Fake Brand',
      model: 'Fake Model',
      barcode: barcode,
      priceIn: 7.80,
      priceSell: 9.99,
    );

    final response = HttpResponse(
        fakeProduct,
        Response<ProductModel>(
          data: fakeProduct,
          requestOptions: RequestOptions(
            path: '/products/barcode/$barcode',
          ),
          statusCode: 200,
        ));

    return Future.value(response);
  }
}
