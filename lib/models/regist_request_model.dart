class RegisterRequestModel {
  RegisterRequestModel({
    required this.fullName,
    required this.username,
    required this.email,
    required this.password,
  });

  late final String fullName;
  late final String username;
  late final String email;
  late final String password;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
