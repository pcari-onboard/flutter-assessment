import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContactsEmpty extends StatelessWidget {
  const MyContactsEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 264.5,
          height: 264.0,
          margin: const EdgeInsets.only(top: 108),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/amico.png'),
            ),
          ),
        ),
        const SizedBox(
          height: 29,
        ),
        Text(
          'No list of contact here,\nadd contact now',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: const Color(0XFF000000),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
