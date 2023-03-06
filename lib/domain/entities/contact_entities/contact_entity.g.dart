// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ContactEntityCWProxy {
  ContactEntity id(int? id);

  ContactEntity first_name(String? first_name);

  ContactEntity last_name(String? last_name);

  ContactEntity avatar(String? avatar);

  ContactEntity email(String? email);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ContactEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ContactEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ContactEntity call({
    int? id,
    String? first_name,
    String? last_name,
    String? avatar,
    String? email,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfContactEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfContactEntity.copyWith.fieldName(...)`
class _$ContactEntityCWProxyImpl implements _$ContactEntityCWProxy {
  const _$ContactEntityCWProxyImpl(this._value);

  final ContactEntity _value;

  @override
  ContactEntity id(int? id) => this(id: id);

  @override
  ContactEntity first_name(String? first_name) => this(first_name: first_name);

  @override
  ContactEntity last_name(String? last_name) => this(last_name: last_name);

  @override
  ContactEntity avatar(String? avatar) => this(avatar: avatar);

  @override
  ContactEntity email(String? email) => this(email: email);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ContactEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ContactEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ContactEntity call({
    Object? id = const $CopyWithPlaceholder(),
    Object? first_name = const $CopyWithPlaceholder(),
    Object? last_name = const $CopyWithPlaceholder(),
    Object? avatar = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
  }) {
    return ContactEntity(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      first_name: first_name == const $CopyWithPlaceholder()
          ? _value.first_name
          // ignore: cast_nullable_to_non_nullable
          : first_name as String?,
      last_name: last_name == const $CopyWithPlaceholder()
          ? _value.last_name
          // ignore: cast_nullable_to_non_nullable
          : last_name as String?,
      avatar: avatar == const $CopyWithPlaceholder()
          ? _value.avatar
          // ignore: cast_nullable_to_non_nullable
          : avatar as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
    );
  }
}

extension $ContactEntityCopyWith on ContactEntity {
  /// Returns a callable class that can be used as follows: `instanceOfContactEntity.copyWith(...)` or like so:`instanceOfContactEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ContactEntityCWProxy get copyWith => _$ContactEntityCWProxyImpl(this);
}
