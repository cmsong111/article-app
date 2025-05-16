import 'package:json_annotation/json_annotation.dart';

part 'paged_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PagedModel<T> {
  final List<T> content;
  final PageInfo page;

  PagedModel({required this.content, required this.page});

  factory PagedModel.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$PagedModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
      Object Function(T value) toJsonT,
      ) =>
      _$PagedModelToJson(this, toJsonT);
}

@JsonSerializable()
class PageInfo {
  final int size;
  final int number;
  final int totalElements;
  final int totalPages;

  PageInfo({
    required this.size,
    required this.number,
    required this.totalElements,
    required this.totalPages,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) =>
      _$PageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PageInfoToJson(this);
}