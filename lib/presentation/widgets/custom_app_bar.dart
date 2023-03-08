import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomWidgetAppBar extends StatelessWidget {
  const CustomWidgetAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0XFF32BAA5),
      toolbarHeight: 78,
      shadowColor: Colors.transparent,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => {},
          icon: Image.asset(
            'assets/images/Union.png',
            width: 21.0,
            height: 17.73,
          ),
        )
      ],
      title: Text(
        'My Contacts',
        style: GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
