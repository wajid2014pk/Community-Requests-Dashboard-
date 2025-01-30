class CommunityRequest {
  final String name;
  final String email;
  final String role;
  String? status;

  CommunityRequest({
    required this.name,
    required this.email,
    required this.role,
    this.status,
  });
}
