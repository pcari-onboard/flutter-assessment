// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'contact_entity.g.dart';

@CopyWith()
class ContactEntity extends Equatable {
  final int? id;
  final String? first_name;
  final String? last_name;
  final String? avatar;
  final String? email;

  @override
  List<Object?> get props => [id, first_name, last_name, avatar, email];

  const ContactEntity({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.avatar,
    required this.email,
  });
}
