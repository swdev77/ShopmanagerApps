import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:shopmanager_mobile_app/core/constants/api_url_constants.dart';
import 'package:shopmanager_mobile_app/features/products/data/models/product_model.dart';

part 'product_api_service.g.dart';

@RestApi(baseUrl: ApiUrlConstants.baseUrl)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;

  @GET(ApiUrlConstants.getProductByBarcodeEndpoint)
  Future<HttpResponse<ProductModel>> getProductByBarcode(
      @Path('barcode') String barcode);
}
