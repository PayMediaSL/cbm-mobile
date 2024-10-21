class User {
  String? username;
  String? nic;
  String? mobile;
  String? name;
  String? email;
  double? points;
  double? authLimit;

  User({
    this.username,
    this.nic,
    this.mobile,
    this.name,
    this.email,
    this.points,
    this.authLimit = 1000.0,
  });

  factory User.fromJson(Map<dynamic, dynamic> map) {
    return User(
      username: map["username"],
      nic: map["nic"],
      mobile: map["mobile"],
      name: map["full_name"],
      email: map["email"],
      points: double.tryParse(map["u_points"].toString()),
      authLimit: double.tryParse(map["auth_limit"].toString()) ?? 1000.0,
    );
  }

  String? get initials {
    try {
      final nameParts = name?.trim().toUpperCase().split(' ') ?? [];

      if (nameParts.isEmpty) {
        return null;
      }

      if (nameParts.length > 1) {
        return nameParts[0][0] + nameParts[1][0];
      }
      return nameParts.first[0];
    } catch (_) {
      return null;
    }
  }
}
