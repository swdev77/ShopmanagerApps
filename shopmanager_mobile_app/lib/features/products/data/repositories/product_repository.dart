import 'dart:io';

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
    try {
      final httpResponse =
          await _productApiService.getProductByBarcode(barcode);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return right(httpResponse.data);
      } else {
        return left(
          ServerFailure(
            message: httpResponse.response.statusMessage ?? 'Unknown error',
            code: httpResponse.response.statusCode.toString(),
          ),
        );
      }
    } catch (e) {
      return left(AppFailure(message: e.toString(), code: ''));
    }
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
