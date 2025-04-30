import 'package:equatable/equatable.dart';
import 'package:shopmanager_mobile_app/core/failure.dart';
import 'package:shopmanager_mobile_app/features/products/domain/entities/product.dart';

abstract class ProductState extends Equatable {
  final Product? product;
  final Failure? failure;

  const ProductState({this.product, this.failure});

  @override
  List<Object?> get props => [product!, failure!];
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductDone extends ProductState {
  const ProductDone(Product product) : super(product: product);
}

class ProductFailure extends ProductState {
  const ProductFailure(Failure failure) : super(failure: failure);
}
