import 'package:dartz/dartz.dart';
import 'package:shopmanager_mobile_app/core/failure.dart';
import 'package:shopmanager_mobile_app/features/products/data/datasources/remote/product_api_service.dart';
import 'package:shopmanager_mobile_app/features/products/data/models/product_model.dart';
import 'package:shopmanager_mobile_app/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService _productApiService;

  ProductRepositoryImpl({required ProductApiService productApiService})
      : _productApiService = productApiService;

  @override
  Future<Either<Failure, ProductModel>> getProductByBarcode(
      String barcode) async {
    final result = await _productApiService.getProductByBarcode(barcode);

    return result.fold(
      (error) {
        return left(
          AppFailure(
            code: '',
            message: 'Unknown error occurred',
          ),
        );
      },
      (productData) {
        return right(ProductModel.fromJson(productData));
      },
    );
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(String id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
