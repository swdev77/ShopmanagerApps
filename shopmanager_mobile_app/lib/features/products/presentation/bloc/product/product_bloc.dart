import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/products/domain/usecases/get_product_by_barcode_usecase.dart';
import 'package:shopmanager_mobile_app/features/products/presentation/bloc/product/product_event.dart';
import 'package:shopmanager_mobile_app/features/products/presentation/bloc/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductByBarcodeUsecase _getProductByBarcodeUsecase;

  ProductBloc(this._getProductByBarcodeUsecase)
      : super(const ProductLoading()) {
    on<GetProductByBarcodeEvent>(onGetProductByBarcode);
  }

  Future<void> onGetProductByBarcode(
      GetProductByBarcodeEvent event, Emitter<ProductState> emit) async {
    final dataState = await _getProductByBarcodeUsecase(event.barcode);

    dataState.fold(
      (failure) {
        emit(ProductFailure(failure));
      },
      (product) {
        emit(ProductDone(product));
      },
    );
  }
}
