import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopmanager_mobile_app/features/products/data/datasources/fake/product_api_service_fake.dart';
import 'package:shopmanager_mobile_app/features/products/data/datasources/remote/product_api_service.dart';
import 'package:shopmanager_mobile_app/features/products/data/repositories/product_repository.dart';
import 'package:shopmanager_mobile_app/features/products/domain/repositories/product_repository.dart';
import 'package:shopmanager_mobile_app/features/products/domain/usecases/get_product_by_barcode_usecase.dart';
import 'package:shopmanager_mobile_app/features/products/presentation/bloc/product/product_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(
    Dio(),
  );

  sl.registerSingleton<ProductApiService>(
    ProductApiServiceFake(),
  );

  sl.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(productApiService: sl<ProductApiService>()),
  );

  sl.registerSingleton<GetProductByBarcodeUsecase>(
    GetProductByBarcodeUsecase(productRepository: sl<ProductRepository>()),
  );

  sl.registerFactory<ProductBloc>(
    () => ProductBloc(sl<GetProductByBarcodeUsecase>()),
  );
}
