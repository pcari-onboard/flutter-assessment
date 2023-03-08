// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FavouriteModelCWProxy {
  FavouriteModel id(String? id);

  FavouriteModel favouriteList(List<ContactModel>? favouriteList);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FavouriteModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FavouriteModel(...).copyWith(id: 12, name: "My name")
  /// ````
  FavouriteModel call({
    String? id,
    List<ContactModel>? favouriteList,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFavouriteModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFavouriteModel.copyWith.fieldName(...)`
class _$FavouriteModelCWProxyImpl implements _$FavouriteModelCWProxy {
  const _$FavouriteModelCWProxyImpl(this._value);

  final FavouriteModel _value;

  @override
  FavouriteModel id(String? id) => this(id: id);

  @override
  FavouriteModel favouriteList(List<ContactModel>? favouriteList) =>
      this(favouriteList: favouriteList);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FavouriteModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FavouriteModel(...).copyWith(id: 12, name: "My name")
  /// ````
  FavouriteModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? favouriteList = const $CopyWithPlaceholder(),
  }) {
    return FavouriteModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      favouriteList: favouriteList == const $CopyWithPlaceholder()
          ? _value.favouriteList
          // ignore: cast_nullable_to_non_nullable
          : favouriteList as List<ContactModel>?,
    );
  }
}

extension $FavouriteModelCopyWith on FavouriteModel {
  /// Returns a callable class that can be used as follows: `instanceOfFavouriteModel.copyWith(...)` or like so:`instanceOfFavouriteModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FavouriteModelCWProxy get copyWith => _$FavouriteModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteModel _$FavouriteModelFromJson(Map<String, dynamic> json) =>
    FavouriteModel(
      id: json['id'] as String?,
      favouriteList: (json['favouriteList'] as List<dynamic>?)
          ?.map((e) => ContactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavouriteModelToJson(FavouriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'favouriteList': instance.favouriteList,
    };
