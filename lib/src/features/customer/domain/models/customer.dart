import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer {
  @JsonSerializable(explicitToJson: true)
  const factory Customer(
      {required int id,
      @JsonKey(name: 'customer_name') required String customerName,
      @JsonKey(name: 'phone') required String phone,
      required int version,
      @JsonKey(name: 'create_username') required String createUsername,
      @JsonKey(name: 'update_username') required String updateUsername,
      @JsonKey(name: 'created_at') required int createdAt,
      @JsonKey(name: 'updated_at') required int updatedAt}) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
