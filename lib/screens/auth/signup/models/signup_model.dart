class SignupModel {
  final String data;
  final String error;
  final String success;
  final String message;
  SignupModel({
    required this.data,
    required this.error,
    required this.success,
    required this.message,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      data: json['data'],
      error: json['error'],
      success: json['success'],
      message: json['message'],
    );
  }
}
