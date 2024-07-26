class LoginModel {
  final bool success;
  final String message;
  final String data;
  final String error;
  LoginModel({
    required this.success,
    required this.message,
    required this.data,
    required this.error,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'],
      message: json['message'],
      data: json['data'],
      error: json['error'],
    );
  }
}

