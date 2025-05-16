// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorProfile _$AuthorProfileFromJson(Map<String, dynamic> json) =>
    AuthorProfile(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      profileImage: json['profileImage'] as String,
    );

Map<String, dynamic> _$AuthorProfileToJson(AuthorProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'profileImage': instance.profileImage,
    };
