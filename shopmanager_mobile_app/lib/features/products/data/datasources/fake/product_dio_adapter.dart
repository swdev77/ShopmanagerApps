import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:shopmanager_mobile_app/core/constants/constants.dart';

class ProductDioAdapter {
  final Dio dio;

  late DioAdapter _dioAdapter;

  ProductDioAdapter({required this.dio}) {
    _dioAdapter = DioAdapter(dio: dio);
  }

  get dioAdapter => _dioAdapter;

  void init() {
    _dioAdapter.onGet(
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
    _dioAdapter.onGet(
      '/products/barcode/$invalidBarcodeValue',
      (server) => server.reply(
        404,
        {
          'error': 'Product not found',
        },
      ),
    );
  }
}
