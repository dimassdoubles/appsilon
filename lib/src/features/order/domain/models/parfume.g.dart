// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parfume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Parfume _$$_ParfumeFromJson(Map<String, dynamic> json) => _$_Parfume(
      id: json['id'] as int,
      parfumeCode: json['parfume_code'] as String,
      parfumeName: json['parfume_name'] as String,
      version: json['version'] as int,
      createUsername: json['create_username'] as String,
      updateUsername: json['update_username'] as String,
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
    );

Map<String, dynamic> _$$_ParfumeToJson(_$_Parfume instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parfume_code': instance.parfumeCode,
      'parfume_name': instance.parfumeName,
      'version': instance.version,
      'create_username': instance.createUsername,
      'update_username': instance.updateUsername,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
