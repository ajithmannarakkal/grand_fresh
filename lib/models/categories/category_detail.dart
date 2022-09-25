class CategoryDetail {
  int? categoryId;
  String? businessTypeId;
  String? categoryDescription;
  String? categoryIcon;
  String? categoryName;

  CategoryDetail({
    this.categoryId,
    this.businessTypeId,
    this.categoryDescription,
    this.categoryIcon,
    this.categoryName,
  });

  factory CategoryDetail.fromJson(Map<String, dynamic> json) {
    return CategoryDetail(
      categoryId: json['category_id'] as int?,
      businessTypeId: json['business_type_id'] as String?,
      categoryDescription: json['category_description'] as String?,
      categoryIcon: json['category_icon'] as String?,
      categoryName: json['category_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'category_id': categoryId,
        'business_type_id': businessTypeId,
        'category_description': categoryDescription,
        'category_icon': categoryIcon,
        'category_name': categoryName,
      };
}
