class VerifyForgetModel {
  VerifyForgetModel({
    this.email,
    this.otp,
  });
  String? email;
  String? otp;
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
    };
  }

  factory VerifyForgetModel.fromJson(Map<String, dynamic> json) {
    return VerifyForgetModel(
      email: json['email'],
      otp: json['otp'],
    );
  }
}
