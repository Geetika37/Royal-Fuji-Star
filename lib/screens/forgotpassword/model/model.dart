class VerifyOTPModel {
  final String success;
  final String message;
  final String data;
  final String error;
  VerifyOTPModel({
    required this.success,
    required this.message,
    required this.data,
    required this.error,
  });

  factory VerifyOTPModel.fromJson(Map<String, dynamic> json) {
    return VerifyOTPModel(
      success: json['success'],
      message: json['message'],
      data: json['data'],
      error: json['error'],
    );
  }
}
