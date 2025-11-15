import 'package:json_annotation/json_annotation.dart';

part 'user_auto.g.dart';

@JsonSerializable()
class UserAuto {
  final String name;
  final String email;
  final int age;

  UserAuto({required this.name, required this.email, required this.age});

  factory UserAuto.fromJson(Map<String, dynamic> json) =>
      _$UserAutoFromJson(json);

  Map<String, dynamic> toJson() => _$UserAutoToJson(this);
}
