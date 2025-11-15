class UserManual {
  final String name;
  final String email;
  final int age;

  UserManual({required this.name, required this.email, required this.age});

  factory UserManual.fromJson(Map<String, dynamic> json) {
    return UserManual(
      name: json['name'],
      email: json['email'],
      age: json['age'] is String ? int.parse(json['age']) : json['age'],
    );
  }

  Map<String, dynamic> toJson() => {'name': name, 'email': email, 'age': age};
}
