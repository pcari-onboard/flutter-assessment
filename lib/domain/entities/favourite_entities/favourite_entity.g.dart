// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FavouriteEntityCWProxy {
  FavouriteEntity id(String? id);

  FavouriteEntity favourite(List<ContactEntity> favourite);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FavouriteEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FavouriteEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  FavouriteEntity call({
    String? id,
    List<ContactEntity>? favourite,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFavouriteEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFavouriteEntity.copyWith.fieldName(...)`
class _$FavouriteEntityCWProxyImpl implements _$FavouriteEntityCWProxy {
  const _$FavouriteEntityCWProxyImpl(this._value);

  final FavouriteEntity _value;

  @override
  FavouriteEntity id(String? id) => this(id: id);

  @override
  FavouriteEntity favourite(List<ContactEntity> favourite) =>
      this(favourite: favourite);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FavouriteEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FavouriteEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  FavouriteEntity call({
    Object? id = const $CopyWithPlaceholder(),
    Object? favourite = const $CopyWithPlaceholder(),
  }) {
    return FavouriteEntity(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      favourite: favourite == const $CopyWithPlaceholder() || favourite == null
          ? _value.favourite
          // ignore: cast_nullable_to_non_nullable
          : favourite as List<ContactEntity>,
    );
  }
}

extension $FavouriteEntityCopyWith on FavouriteEntity {
  /// Returns a callable class that can be used as follows: `instanceOfFavouriteEntity.copyWith(...)` or like so:`instanceOfFavouriteEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FavouriteEntityCWProxy get copyWith => _$FavouriteEntityCWProxyImpl(this);
}
