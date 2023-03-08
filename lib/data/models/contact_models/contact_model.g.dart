// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ContactModelCWProxy {
  ContactModel id(int? id);

  ContactModel avatar(String? avatar);

  ContactModel first_name(String? first_name);

  ContactModel last_name(String? last_name);

  ContactModel email(String? email);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ContactModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ContactModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ContactModel call({
    int? id,
    String? avatar,
    String? first_name,
    String? last_name,
    String? email,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfContactModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfContactModel.copyWith.fieldName(...)`
class _$ContactModelCWProxyImpl implements _$ContactModelCWProxy {
  const _$ContactModelCWProxyImpl(this._value);

  final ContactModel _value;

  @override
  ContactModel id(int? id) => this(id: id);

  @override
  ContactModel avatar(String? avatar) => this(avatar: avatar);

  @override
  ContactModel first_name(String? first_name) => this(first_name: first_name);

  @override
  ContactModel last_name(String? last_name) => this(last_name: last_name);

  @override
  ContactModel email(String? email) => this(email: email);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ContactModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ContactModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ContactModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? avatar = const $CopyWithPlaceholder(),
    Object? first_name = const $CopyWithPlaceholder(),
    Object? last_name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
  }) {
    return ContactModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      avatar: avatar == const $CopyWithPlaceholder()
          ? _value.avatar
          // ignore: cast_nullable_to_non_nullable
          : avatar as String?,
      first_name: first_name == const $CopyWithPlaceholder()
          ? _value.first_name
          // ignore: cast_nullable_to_non_nullable
          : first_name as String?,
      last_name: last_name == const $CopyWithPlaceholder()
          ? _value.last_name
          // ignore: cast_nullable_to_non_nullable
          : last_name as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
    );
  }
}

extension $ContactModelCopyWith on ContactModel {
  /// Returns a callable class that can be used as follows: `instanceOfContactModel.copyWith(...)` or like so:`instanceOfContactModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ContactModelCWProxy get copyWith => _$ContactModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) => ContactModel(
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'avatar': instance.avatar,
      'email': instance.email,
    };
