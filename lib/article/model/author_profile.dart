import 'package:json_annotation/json_annotation.dart';

part 'author_profile.g.dart';

@JsonSerializable()
class AuthorProfile {
  final int id;
  final String email;
  final String name;
  final String profileImage;

  AuthorProfile({
    required this.id,
    required this.email,
    required this.name,
    required this.profileImage,
  });

  factory AuthorProfile.fromJson(Map<String, dynamic> json) =>
      _$AuthorProfileFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorProfileToJson(this);
}
