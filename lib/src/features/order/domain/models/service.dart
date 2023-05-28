import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'service.freezed.dart';
part 'service.g.dart';

@freezed
class Service with _$Service {
  @JsonSerializable(explicitToJson: true)
  const factory Service(
      {required int id,
      @JsonKey(name: 'service_code') required String serviceCode,
      @JsonKey(name: 'service_name') required String serviceName,
      required int version,
      required int price,
      @JsonKey(name: 'create_username') required String createUsername,
      @JsonKey(name: 'update_username') required String updateUsername,
      @JsonKey(name: 'created_at') required int createdAt,
      @JsonKey(name: 'updated_at') required int updatedAt}) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
