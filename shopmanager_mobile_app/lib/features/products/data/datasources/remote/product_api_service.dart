import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:shopmanager_mobile_app/core/constants/constants.dart';
import 'package:shopmanager_mobile_app/features/products/data/models/product_model.dart';

part 'product_api_service.g.dart';

@RestApi(baseUrl: shopmanagerAPIBaseURL)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;

  @GET('/products/barcode/{barcode}')
  Future<HttpResponse<ProductModel>> getProductByBarcode(
    @Path('barcode') String barcode);
}