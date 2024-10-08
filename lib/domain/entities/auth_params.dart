class AuthParams {
  final String email;
  final String password;
  final String? username;

  AuthParams({
    required this.email,
    required this.password,
    this.username,
  });
}
