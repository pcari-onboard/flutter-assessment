import 'package:assessment/base/utils/contact_permission.dart';
import 'package:assessment/presentation/pages/profile/profile_viewmodels/profile_viewmodel.dart';
import 'package:assessment/presentation/pages/profile/profile_viewmodels/profile_widget_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ProfileViewModel, ProfileWidgetViewModel>(
      builder: (context, value, value2, child) => Stack(
        children: [
          PositionedTransition(
            rect: value2.bodyAnimation,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Text(
                    '${value.contact!.first_name}  ${value.contact!.last_name}',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: 91,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0XFFF1F1F1),
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    bottom: 14.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/email.png',
                        cacheWidth: 44,
                        cacheHeight: 31,
                      ),
                      Text(
                        '${value.contact!.email}',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22.0),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    fixedSize: const MaterialStatePropertyAll(
                      Size(360.0, 47.0),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Color(0XFF32BAA5),
                    ),
                  ),
                  onPressed: () => {
                    openEmailApp(
                      email: value.contact!.email,
                      subject:
                          "Testing sending an email by ${value.contact!.first_name} ${value.contact!.last_name}",
                      message:
                          "This is a native kotlin action using channel method! :)",
                    ),
                  },
                  child: Text(
                    'Send Email',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
