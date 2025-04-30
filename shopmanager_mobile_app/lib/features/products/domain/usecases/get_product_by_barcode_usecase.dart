import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductByBarcodeUsecase {
  final ProductRepository productRepository;

  GetProductByBarcodeUsecase({required this.productRepository});

  Future<Either<Failure, Product>> call(String barcode) async {
    return await productRepository.getProductByBarcode(barcode);
  }
}