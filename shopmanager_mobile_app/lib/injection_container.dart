import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopmanager_mobile_app/core/network/dio_client.dart';
import 'package:shopmanager_mobile_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:shopmanager_mobile_app/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:shopmanager_mobile_app/features/auth/data/sources/auth_api_service.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/repositories/firebase_auth_repository.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/authentication_repository.dart';
import 'package:shopmanager_mobile_app/features/products/data/datasources/fake/product_dio_adapter.dart';
import 'package:shopmanager_mobile_app/features/products/data/datasources/remote/product_api_service.dart';
import 'package:shopmanager_mobile_app/features/products/data/repositories/product_repository.dart';
import 'package:shopmanager_mobile_app/features/products/domain/repositories/product_repository.dart';
import 'package:shopmanager_mobile_app/features/products/domain/usecases/get_product_by_barcode_usecase.dart';
import 'package:shopmanager_mobile_app/features/products/presentation/bloc/product/product_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<FirebaseAuthRepository>(
    FirebaseAuthRepositoryImpl(),
  );

  sl.registerSingleton<AuthenticationRepository>(
    AuthenticationRepository(),
  );

  // faking dio
  final dio = Dio();

  ProductDioAdapter(dio: dio).init();

  sl.registerSingleton<Dio>(
    dio, //Dio(),
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
    SigninUsecase(authRepository: sl<FirebaseAuthRepository>()),
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
