class OtpModel {
  OtpModel({this.username, this.email, this.password, this.phone});

  String? username;
  String? email;
  String? phone;
  String? password;
  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
      };
  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      username: json['email'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
