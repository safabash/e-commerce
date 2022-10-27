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
}
