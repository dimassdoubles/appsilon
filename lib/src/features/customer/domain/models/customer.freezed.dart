// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String get phone => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
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
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'phone') String phone,
      int version,
      @JsonKey(name: 'create_username') String createUsername,
      @JsonKey(name: 'update_username') String updateUsername,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(name: 'updated_at') int updatedAt});
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerName = null,
    Object? phone = null,
    Object? version = null,
    Object? createUsername = null,
    Object? updateUsername = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$$_CustomerCopyWith(
          _$_Customer value, $Res Function(_$_Customer) then) =
      __$$_CustomerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'phone') String phone,
      int version,
      @JsonKey(name: 'create_username') String createUsername,
      @JsonKey(name: 'update_username') String updateUsername,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(name: 'updated_at') int updatedAt});
}

/// @nodoc
class __$$_CustomerCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$_Customer>
    implements _$$_CustomerCopyWith<$Res> {
  __$$_CustomerCopyWithImpl(
      _$_Customer _value, $Res Function(_$_Customer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerName = null,
    Object? phone = null,
    Object? version = null,
    Object? createUsername = null,
    Object? updateUsername = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Customer(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
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
class _$_Customer with DiagnosticableTreeMixin implements _Customer {
  const _$_Customer(
      {required this.id,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'phone') required this.phone,
      required this.version,
      @JsonKey(name: 'create_username') required this.createUsername,
      @JsonKey(name: 'update_username') required this.updateUsername,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$_Customer.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'phone')
  final String phone;
  @override
  final int version;
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
    return 'Customer(id: $id, customerName: $customerName, phone: $phone, version: $version, createUsername: $createUsername, updateUsername: $updateUsername, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Customer'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('customerName', customerName))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('version', version))
      ..add(DiagnosticsProperty('createUsername', createUsername))
      ..add(DiagnosticsProperty('updateUsername', updateUsername))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Customer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.version, version) || other.version == version) &&
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
  int get hashCode => Object.hash(runtimeType, id, customerName, phone, version,
      createUsername, updateUsername, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerCopyWith<_$_Customer> get copyWith =>
      __$$_CustomerCopyWithImpl<_$_Customer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerToJson(
      this,
    );
  }
}

abstract class _Customer implements Customer {
  const factory _Customer(
      {required final int id,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'phone') required final String phone,
      required final int version,
      @JsonKey(name: 'create_username') required final String createUsername,
      @JsonKey(name: 'update_username') required final String updateUsername,
      @JsonKey(name: 'created_at') required final int createdAt,
      @JsonKey(name: 'updated_at') required final int updatedAt}) = _$_Customer;

  factory _Customer.fromJson(Map<String, dynamic> json) = _$_Customer.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'phone')
  String get phone;
  @override
  int get version;
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
  _$$_CustomerCopyWith<_$_Customer> get copyWith =>
      throw _privateConstructorUsedError;
}
