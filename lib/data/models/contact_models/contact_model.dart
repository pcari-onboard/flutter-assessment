// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'contact_model.g.dart';

@CopyWith()
@JsonSerializable()
class ContactModel extends Equatable {
  const ContactModel({
    required this.id,
    required this.avatar,
    required this.first_name,
    required this.last_name,
    required this.email,
  });

  @JsonKey(name: 'id')
  final int? id;
  final String? first_name;
  final String? last_name;
  final String? avatar;
  final String? email;

  @override
  List<Object?> get props => [id, first_name, last_name, avatar, email];

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}
