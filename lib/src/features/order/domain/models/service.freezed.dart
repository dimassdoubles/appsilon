// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_code')
  String get serviceCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_name')
  String get serviceName => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_username')
  String get createUsername => throw _privateConstructorUsedError;
  @JsonKey(name: 'update_username')
  String get updateUsername => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  int get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res, Service>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'service_code') String serviceCode,
      @JsonKey(name: 'service_name') String serviceName,
      int version,
      int price,
      @JsonKey(name: 'create_username') String createUsername,
      @JsonKey(name: 'update_username') String updateUsername,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(name: 'updated_at') int updatedAt});
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res, $Val extends Service>
    implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serviceCode = null,
    Object? serviceName = null,
    Object? version = null,
    Object? price = null,
    Object? createUsername = null,
    Object? updateUsername = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      serviceCode: null == serviceCode
          ? _value.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      createUsername: null == createUsername
          ? _value.createUsername
          : createUsername // ignore: cast_nullable_to_non_nullable
              as String,
      updateUsername: null == updateUsername
          ? _value.updateUsername
          : updateUsername // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServiceCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$_ServiceCopyWith(
          _$_Service value, $Res Function(_$_Service) then) =
      __$$_ServiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'service_code') String serviceCode,
      @JsonKey(name: 'service_name') String serviceName,
      int version,
      int price,
      @JsonKey(name: 'create_username') String createUsername,
      @JsonKey(name: 'update_username') String updateUsername,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(name: 'updated_at') int updatedAt});
}

/// @nodoc
class __$$_ServiceCopyWithImpl<$Res>
    extends _$ServiceCopyWithImpl<$Res, _$_Service>
    implements _$$_ServiceCopyWith<$Res> {
  __$$_ServiceCopyWithImpl(_$_Service _value, $Res Function(_$_Service) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serviceCode = null,
    Object? serviceName = null,
    Object? version = null,
    Object? price = null,
    Object? createUsername = null,
    Object? updateUsername = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Service(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      serviceCode: null == serviceCode
          ? _value.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      createUsername: null == createUsername
          ? _value.createUsername
          : createUsername // ignore: cast_nullable_to_non_nullable
              as String,
      updateUsername: null == updateUsername
          ? _value.updateUsername
          : updateUsername // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Service with DiagnosticableTreeMixin implements _Service {
  const _$_Service(
      {required this.id,
      @JsonKey(name: 'service_code') required this.serviceCode,
      @JsonKey(name: 'service_name') required this.serviceName,
      required this.version,
      required this.price,
      @JsonKey(name: 'create_username') required this.createUsername,
      @JsonKey(name: 'update_username') required this.updateUsername,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$_Service.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'service_code')
  final String serviceCode;
  @override
  @JsonKey(name: 'service_name')
  final String serviceName;
  @override
  final int version;
  @override
  final int price;
  @override
  @JsonKey(name: 'create_username')
  final String createUsername;
  @override
  @JsonKey(name: 'update_username')
  final String updateUsername;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final int updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Service(id: $id, serviceCode: $serviceCode, serviceName: $serviceName, version: $version, price: $price, createUsername: $createUsername, updateUsername: $updateUsername, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Service'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('serviceCode', serviceCode))
      ..add(DiagnosticsProperty('serviceName', serviceName))
      ..add(DiagnosticsProperty('version', version))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('createUsername', createUsername))
      ..add(DiagnosticsProperty('updateUsername', updateUsername))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Service &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.serviceCode, serviceCode) ||
                other.serviceCode == serviceCode) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.createUsername, createUsername) ||
                other.createUsername == createUsername) &&
            (identical(other.updateUsername, updateUsername) ||
                other.updateUsername == updateUsername) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, serviceCode, serviceName,
      version, price, createUsername, updateUsername, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceCopyWith<_$_Service> get copyWith =>
      __$$_ServiceCopyWithImpl<_$_Service>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceToJson(
      this,
    );
  }
}

abstract class _Service implements Service {
  const factory _Service(
      {required final String id,
      @JsonKey(name: 'service_code') required final String serviceCode,
      @JsonKey(name: 'service_name') required final String serviceName,
      required final int version,
      required final int price,
      @JsonKey(name: 'create_username') required final String createUsername,
      @JsonKey(name: 'update_username') required final String updateUsername,
      @JsonKey(name: 'created_at') required final int createdAt,
      @JsonKey(name: 'updated_at') required final int updatedAt}) = _$_Service;

  factory _Service.fromJson(Map<String, dynamic> json) = _$_Service.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'service_code')
  String get serviceCode;
  @override
  @JsonKey(name: 'service_name')
  String get serviceName;
  @override
  int get version;
  @override
  int get price;
  @override
  @JsonKey(name: 'create_username')
  String get createUsername;
  @override
  @JsonKey(name: 'update_username')
  String get updateUsername;
  @override
  @JsonKey(name: 'created_at')
  int get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  int get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceCopyWith<_$_Service> get copyWith =>
      throw _privateConstructorUsedError;
}
