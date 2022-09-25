import 'category_detail.dart';

class Categories {
  List<CategoryDetail>? categoryDetails;
  int? status;
  String? message;

  Categories({this.categoryDetails, this.status, this.message});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categoryDetails: (json['CategoryDetails'] as List<dynamic>?)
            ?.map((e) => CategoryDetail.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'CategoryDetails': categoryDetails?.map((e) => e.toJson()).toList(),
        'status': status,
        'message': message,
      };
}
