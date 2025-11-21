// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuto _$UserAutoFromJson(Map<String, dynamic> json) => UserAuto(
  name: json['name'] as String,
  email: json['email'] as String,
  age: (json['age'] as num).toInt(),
);

Map<String, dynamic> _$UserAutoToJson(UserAuto instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'age': instance.age,
};
