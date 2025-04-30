class Product {
  final int id;
  final String type;
  final String brand;
  final String model;
  final String barcode;
  final double? priceIn;
  final double? priceSell;

  Product(
      {required this.id,
      required this.type,
      required this.brand,
      required this.model,
      required this.barcode,
      this.priceIn,
      this.priceSell});
}
