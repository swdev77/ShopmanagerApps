import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.type,
    required super.brand,
    required super.model,
    required super.barcode,
    super.priceIn,
    super.priceSell,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      type: json['type'],
      brand: json['brand'],
      model: json['model'],
      barcode: json['barcode'],
    );
  }
}
