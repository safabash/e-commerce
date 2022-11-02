class LogInModel {
  LogInModel({
    this.username,
    this.password,
  });
  String? username;
  String? password;
  Map<String, dynamic> toJson() => {
        "email": username,
        "password": password,
      };
  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(
      username: json['email'],
      password: json['password'],
    );
  }
}
