import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';
import 'package:assessment/domain/usecases/profile_usecases.dart';
import 'package:assessment/presentation/pages/profile/profile_viewmodels/profile_widget_viewmodel.dart';
import 'package:flutter/widgets.dart';

class ProfileViewModel extends ChangeNotifier {
  ContactEntity? contact;
  ProfileWidgetViewModel? profileWidgetViewModel;
  GetContactUseCase? getContactUseCase;
  EditContactUseCase? editContactUseCase;

  ProfileViewModel({
    this.profileWidgetViewModel,
    this.editContactUseCase,
    this.getContactUseCase,
  });

  Future<void> getContact({String? id}) async {
    contact = await getContactUseCase!.execute(id: id!);
    profileWidgetViewModel!.loading = false;
  }

  Future<void> editContact({ContactEntity? contactObj}) async {
    profileWidgetViewModel!.loadingEdit = true;
    contact = await editContactUseCase!.execute(contact: contactObj!);
    profileWidgetViewModel!.loadingEdit = false;
  }
}
