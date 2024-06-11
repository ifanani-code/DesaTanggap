class EditProfileRequestModel {
  EditProfileRequestModel({
    required this.fullName,
    required this.email,
    required this.address,
  });

  late final String fullName;
  late final String email;
  late final String address;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email; // Mengganti password dengan email
    data['address'] = address;
    return data;
  }
}
