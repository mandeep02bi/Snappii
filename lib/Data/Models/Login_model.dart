class LoginHistoryModel {
  final int id;
  final String userName;
  final String email;
  final String ip;
  final String location;
  final String device;
  final String role;
  final String time;

  LoginHistoryModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.ip,
    required this.location,
    required this.device,
    required this.role,
    required this.time,
  });
}
