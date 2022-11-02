class SignUpUserModel {
  SignUpUserModel({
    this.username,
    this.email,
    this.password,
    this.phone,
  });
  String? username;
  String? email;
  String? phone;
  String? password;

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'password': password,
        'phone': phone
      };
  factory SignUpUserModel.fromJson(Map<String, dynamic> json) {
    return SignUpUserModel(
        username: json['email'],
        password: json['password'],
        phone: json['phone'],
        email: json['email']);
  }
}
