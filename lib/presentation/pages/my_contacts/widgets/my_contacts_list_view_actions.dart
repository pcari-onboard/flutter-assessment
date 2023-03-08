import 'package:assessment/presentation/pages/my_contacts/viewmodels/user_widget_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyContactsListViewActions extends StatelessWidget {
  const MyContactsListViewActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserWidgetViewmodel>(
      builder: (BuildContext context, value, Widget? child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37.0, vertical: 20.0),
        child: Row(
          children: [
            InkWell(
              onTap: () => value.isAll = true,
              child: Container(
                width: 32,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: value.isAll! ? const Color(0XFF32BAA5) : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                      color: const Color(0XFF000000).withOpacity(0.05),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'All',
                    style: GoogleFonts.raleway(
                      color:
                          value.isAll! ? Colors.white : const Color(0XFF8D8DAB),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            InkWell(
              onTap: () => value.isAll = false,
              child: Container(
                width: 68,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: value.isAll! ? Colors.white : const Color(0XFF32BAA5),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                      color: const Color(0XFF000000).withOpacity(0.05),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Favourite',
                    style: GoogleFonts.raleway(
                      color: value.isAll!
                          ? const Color(0XFF8D8DAB)
                          : const Color(0XFFFFFFFF),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
