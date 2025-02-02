class LoginModel {
  final dynamic status;
  final String? message;
  final LoginData? data;

  LoginModel({required this.status, required this.message, required this.data});
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
      );
  Map<String, dynamic> toJson() =>
      {"status": status, "message": message, "data": data};
}

class LoginData {
  final String email;
  final String token;

  LoginData({required this.email, required this.token});
  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(email: json['email'], token: json['token']);
  }
  Map<String, dynamic> toJson() => {
        "email": email,
        "token": token,
      };
}
