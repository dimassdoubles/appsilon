import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'parfume.freezed.dart';
part 'parfume.g.dart';

@freezed
class Parfume with _$Parfume {
  @JsonSerializable(explicitToJson: true)
  const factory Parfume(
      {required int id,
      @JsonKey(name: 'parfume_code') required String parfumeCode,
      @JsonKey(name: 'parfume_name') required String parfumeName,
      required int version,
      @JsonKey(name: 'create_username') required String createUsername,
      @JsonKey(name: 'update_username') required String updateUsername,
      @JsonKey(name: 'created_at') required int createdAt,
      @JsonKey(name: 'updated_at') required int updatedAt}) = _Parfume;

  factory Parfume.fromJson(Map<String, dynamic> json) =>
      _$ParfumeFromJson(json);
}