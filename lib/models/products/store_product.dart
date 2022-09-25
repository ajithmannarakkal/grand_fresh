class StoreProduct {
  int? productId;
  String? productName;
  String? productCode;
  String? productBaseImage;
  String? showInHomeScreen;
  String? productStatus;
  String? productVarientId;
  String? variantName;
  String? productVarientPrice;
  String? productVarientOfferPrice;
  String? productVarientBaseImage;
  String? stockCount;
  String? storeId;

  StoreProduct({
    this.productId,
    this.productName,
    this.productCode,
    this.productBaseImage,
    this.showInHomeScreen,
    this.productStatus,
    this.productVarientId,
    this.variantName,
    this.productVarientPrice,
    this.productVarientOfferPrice,
    this.productVarientBaseImage,
    this.stockCount,
    this.storeId,
  });

  factory StoreProduct.fromJson(Map<String, dynamic> json) => StoreProduct(
        productId: json['product_id'] as int?,
        productName: json['product_name'] as String?,
        productCode: json['product_code'] as String?,
        productBaseImage: json['product_base_image'] as String?,
        showInHomeScreen: json['show_in_home_screen'] as String?,
        productStatus: json['product_status'] as String?,
        productVarientId: json['product_varient_id'] as String?,
        variantName: json['variant_name'] as String?,
        productVarientPrice: json['product_varient_price'] as String?,
        productVarientOfferPrice:
            json['product_varient_offer_price'] as String?,
        productVarientBaseImage: json['product_varient_base_image'] as String?,
        stockCount: json['stock_count'] as String?,
        storeId: json['store_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'product_name': productName,
        'product_code': productCode,
        'product_base_image': productBaseImage,
        'show_in_home_screen': showInHomeScreen,
        'product_status': productStatus,
        'product_varient_id': productVarientId,
        'variant_name': variantName,
        'product_varient_price': productVarientPrice,
        'product_varient_offer_price': productVarientOfferPrice,
        'product_varient_base_image': productVarientBaseImage,
        'stock_count': stockCount,
        'store_id': storeId,
      };
}
