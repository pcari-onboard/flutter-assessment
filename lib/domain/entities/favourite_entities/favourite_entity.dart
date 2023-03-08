// ignore: depend_on_referenced_packages
import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'favourite_entity.g.dart';

@CopyWith()
class FavouriteEntity extends Equatable {
  final String? id;
  final List<ContactEntity> favourite;

  const FavouriteEntity({required this.id, required this.favourite});

  @override
  List<Object?> get props => [id, favourite];
}
