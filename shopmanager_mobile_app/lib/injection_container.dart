import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:shopmanager_mobile_app/core/constants/constants.dart';
import 'package:shopmanager_mobile_app/core/network/dio_client.dart';
import 'package:shopmanager_mobile_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:shopmanager_mobile_app/features/auth/data/sources/auth_api_service.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:shopmanager_mobile_app/features/products/data/datasources/remote/product_api_service.dart';
import 'package:shopmanager_mobile_app/features/products/data/repositories/product_repository.dart';
import 'package:shopmanager_mobile_app/features/products/domain/repositories/product_repository.dart';
import 'package:shopmanager_mobile_app/features/products/domain/usecases/get_product_by_barcode_usecase.dart';
import 'package:shopmanager_mobile_app/features/products/presentation/bloc/product/product_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // faking dio
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  dioAdapter.onGet(
    '/products/barcode/$barcodeValue',
    (server) {
      server.reply(
        200,
        {
          'id': 1,
          'type': 'Fake Type from Dio Adapter',
          'brand': 'Fake Brand from Dio Adapter',
          'model': 'Fake Model from Dio Adapter',
          'barcode': '1234567890123',
          'priceIn': 7.80,
          'priceSell': 9.99,
        },
      );
    },
  );
  dioAdapter.onGet(
    '/products/barcode/$invalidBarcodeValue',
    (server) => server.reply(
      404,
      {
        'error': 'Product not found',
      },
    ),
  );

  sl.registerSingleton<Dio>(
    Dio(),
  );

  sl.registerSingleton<DioClient>(
    DioClient(),
  );
  sl.registerSingleton<AuthApiService>(
    AuthApiServiceImpl(dioClient: sl<DioClient>()),
  );
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(authApiService: sl<AuthApiService>()),
  );
  sl.registerSingleton<SigninUsecase>(
    SigninUsecase(authRepository: sl<AuthRepository>()),
  );

  sl.registerSingleton<ProductApiService>(
    ProductApiService(sl<Dio>()),
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
