class SpareModel {
  String success;
  String data;
  String message;
  String error;
  SpareModel({
    required this.success,
    required this.data,
    required this.message,
    required this.error,
  });

  factory SpareModel.fromJson(Map<String, dynamic> json) {
    return SpareModel(
      success: json['success'],
      data: json['data'],
      message: json['message'],
      error: json['error'],
    );
  }
}
