class ProductCategoryModel {
  final bool success; 
  final List<dynamic> data;
  final String message;

  ProductCategoryModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      success: json['success'],
      data: json['data'],
      message: json['message'] ,
    );
  }
}

