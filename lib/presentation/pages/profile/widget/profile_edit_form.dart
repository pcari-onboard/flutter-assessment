import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';
import 'package:assessment/presentation/pages/profile/profile_viewmodels/profile_viewmodel.dart';
import 'package:assessment/presentation/pages/profile/profile_viewmodels/profile_widget_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProfileEditForm extends StatefulWidget {
  const ProfileEditForm({super.key});

  @override
  State<ProfileEditForm> createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  InputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.0,
      color: Color(0XFF32BAA5),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(100.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProfileViewModel, ProfileWidgetViewModel>(
      builder: (context, value, value2, child) => Stack(
        children: [
          for (var i in [
            [
              'First Name',
              215.0,
              0,
              value2.firstNameController,
              value2.transition
            ],
            [
              'Last Name',
              305.0,
              0,
              value2.lastNameController,
              value2.transition2
            ],
            ['Email', 397.0, 0, value2.emailController, value2.transition3],
          ])
            PositionedTransition(
              rect: i[4] as Animation<RelativeRect>,
              child: Padding(
                padding: const EdgeInsets.only(left: 37.0, right: 31.14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 21.71, bottom: 5.0),
                      child: Text(
                        i[0].toString(),
                        style: GoogleFonts.montserrat(
                          color: const Color(0XFF32BAA5),
                          fontSize: 11.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextField(
                      onChanged: (_value) => {},
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      // focusNode: value.focusNode,
                      controller: i[3] as TextEditingController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 24),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: border,
                        focusedBorder: border,
                        border: border,
                        constraints: const BoxConstraints(maxHeight: 48.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          PositionedTransition(
            rect: value2.transition4,
            child: Padding(
              padding: const EdgeInsets.only(left: 37, right: 31.14),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: const MaterialStatePropertyAll(
                            Size(double.infinity, 47.0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        backgroundColor: const MaterialStatePropertyAll(
                          Color(0XFF32BAA5),
                        ),
                      ),
                      onPressed: () async {
                        await value.editContact(
                            contactObj: value.contact!.copyWith(
                          first_name: value2.firstNameController.text,
                          last_name: value2.lastNameController.text,
                          email: value2.emailController.text,
                        ));
                        if (value2.loadingEdit == false) {
                          value2.edit = false;
                          value2.inputsController4.reverse();
                          value2.editController.reverse().whenComplete(
                              () => value2.starScaleController.forward());
                        }
                      },
                      child: Text(
                        'Done',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
