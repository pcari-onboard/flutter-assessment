import 'package:assessment/presentation/pages/my_contacts/viewmodels/user_widget_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyContactsSearchBar extends StatelessWidget {
  const MyContactsSearchBar({
    super.key,
    required this.border,
  });

  final InputBorder border;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserWidgetViewmodel>(
      builder: (context, value, child) => Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            left: -10,
            top: -200.0,
            child: ScaleTransition(
              scale: value.animation,
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5000),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 90.0,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 21, right: 18),
            child: Center(
              child: TextField(
                onChanged: (_value) => {value.searchController = _value},
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0XFF999999),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                focusNode: value.focusNode,
                controller: value.getSearchController(),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  suffixIcon: Image.asset(
                    'assets/images/search.png',
                    cacheHeight: 18,
                    cacheWidth: 18,
                  ),
                  label: const Text(
                    'Search Contact',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      color: Color(0XFF999999),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: border,
                  focusedBorder: border,
                  border: border,
                  constraints: const BoxConstraints(maxHeight: 48.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
