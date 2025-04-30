import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> getProductById(String id);
  Future<Either<Failure, Product>> getProductByBarcode(String barcode); 
}