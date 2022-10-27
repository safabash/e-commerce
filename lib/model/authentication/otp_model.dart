class OtpModel {
  OtpModel({this.code, this.username, this.email, this.password, this.phone});
  String? code;
  String? username;
  String? email;
  String? phone;
  String? password;
  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
        'code': code
      };
}
