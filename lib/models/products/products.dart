import 'store_product.dart';

class Products {
  List<StoreProduct>? storeProducts;
  int? status;
  String? message;

  Products({this.storeProducts, this.status, this.message});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        storeProducts: (json['storeProducts'] as List<dynamic>?)
            ?.map((e) => StoreProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'storeProducts': storeProducts?.map((e) => e.toJson()).toList(),
        'status': status,
        'message': message,
      };
}
