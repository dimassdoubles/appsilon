// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Customer _$$_CustomerFromJson(Map<String, dynamic> json) => _$_Customer(
      id: json['id'] as int,
      customerName: json['customer_name'] as String,
      phone: json['phone'] as String,
      version: json['version'] as int,
      createUsername: json['create_username'] as String,
      updateUsername: json['update_username'] as String,
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
    );

Map<String, dynamic> _$$_CustomerToJson(_$_Customer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_name': instance.customerName,
      'phone': instance.phone,
      'version': instance.version,
      'create_username': instance.createUsername,
      'update_username': instance.updateUsername,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
