abstract class ProductEvent {
  const ProductEvent();
}

class GetProductByBarcodeEvent extends ProductEvent {
  final String barcode;
  const GetProductByBarcodeEvent(this.barcode);
}
