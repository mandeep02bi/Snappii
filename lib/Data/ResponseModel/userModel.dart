class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final int rtypeId;
  final String? userType;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.rtypeId,
    this.userType,
  });

  @override
    String toString() {
      return '''
    UserModel(
      userId: $userId,
      firstName: $firstName,
      lastName: $lastName,
      mobileNumber: $mobileNumber,
      roleId: $rtypeId
    )
    ''';
    }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["user_id"] ?? "",
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"] ?? "",
      email: json["email"] ?? "",
      mobileNumber: json["mobile_number"] ?? "",
      rtypeId: int.tryParse(json['rtype_id']?.toString() ?? '') ?? -1,
      userType: json["user_type"],
    );
  }
}
