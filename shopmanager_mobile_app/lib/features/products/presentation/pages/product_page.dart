import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/core/constants/constants.dart';
import 'package:shopmanager_mobile_app/features/products/presentation/bloc/product/product_bloc.dart';
import 'package:shopmanager_mobile_app/features/products/presentation/bloc/product/product_event.dart';
import 'package:shopmanager_mobile_app/features/products/presentation/bloc/product/product_state.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  _appBar() {
    return AppBar(title: const Text('Product'));
  }

  _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Enter barcode',
              filled: true,
            ),
            onChanged: (value) {
              if (value.isEmpty && value.length < 13) {
                value = invalidBarcodeValue;
              }
              context.read<ProductBloc>().add(
                    GetProductByBarcodeEvent(value),
                  );
            },
          ),
          const SizedBox(height: 20),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductFailure) {
                var failure = state.failure!;
                return Center(
                  child: Column(
                    children: [
                      Text(failure.message),
                      Text(failure.code),
                    ],
                  ),
                );
              }
              if (state is ProductDone) {
                var product = state.product!;

                return Column(
                  children: [
                    Text('id: ${product.id}'),
                    Text('type: ${product.type}'),
                    Text('brand: ${product.brand}'),
                    Text('model: ${product.model}'),
                    Text('barcode: ${product.barcode}'),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
