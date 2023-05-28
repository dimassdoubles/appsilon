// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Service _$$_ServiceFromJson(Map<String, dynamic> json) => _$_Service(
      id: json['id'] as int,
      serviceCode: json['service_code'] as String,
      serviceName: json['service_name'] as String,
      version: json['version'] as int,
      price: json['price'] as int,
      createUsername: json['create_username'] as String,
      updateUsername: json['update_username'] as String,
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
    );

Map<String, dynamic> _$$_ServiceToJson(_$_Service instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_code': instance.serviceCode,
      'service_name': instance.serviceName,
      'version': instance.version,
      'price': instance.price,
      'create_username': instance.createUsername,
      'update_username': instance.updateUsername,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
