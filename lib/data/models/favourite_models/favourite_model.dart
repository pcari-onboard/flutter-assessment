// ignore: depend_on_referenced_packages
import 'package:assessment/data/models/contact_models/contact_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favourite_model.g.dart';

@CopyWith()
@JsonSerializable()
class FavouriteModel extends Equatable {
  const FavouriteModel({
    required this.id,
    required this.favouriteList,
  });

  @JsonKey(name: 'id')
  final String? id;
  final List<ContactModel>? favouriteList;

  factory FavouriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavouriteModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavouriteModelToJson(this);

  @override
  List<Object?> get props => [id, favouriteList];
}
