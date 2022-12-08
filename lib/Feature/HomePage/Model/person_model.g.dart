// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      employment: json['employment'] == null
          ? null
          : Employment.fromJson(json['employment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
      'employment': instance.employment,
    };

Employment _$EmploymentFromJson(Map<String, dynamic> json) => Employment(
      title: json['title'] as String?,
      keySkill: json['keySkill'] as String?,
    );

Map<String, dynamic> _$EmploymentToJson(Employment instance) =>
    <String, dynamic>{
      'title': instance.title,
      'keySkill': instance.keySkill,
    };
