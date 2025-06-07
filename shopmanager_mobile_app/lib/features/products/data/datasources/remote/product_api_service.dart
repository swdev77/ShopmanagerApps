import 'package:dartz/dartz.dart';
import 'package:shopmanager_mobile_app/core/network/dio_client.dart';

class ProductApiService {
  final DioClient dioClient;

  ProductApiService({required this.dioClient});

  Future<Either> getProductByBarcode(String barcode) async {
    try {
      final response = await dioClient.get('/products/barcode/$barcode');
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left('Error: ${response.statusMessage}');
      }
    } catch (e) {
      return Left('Failed to fetch product by barcode: $e');
    }
  }
}
