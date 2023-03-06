import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0, bottom: 32.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 32,
            spreadRadius: 0,
            offset: const Offset(0, 4),
            color: const Color(0XFF466087).withOpacity(0.25),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: const Color(0XFF32BAA5),
        child: Image.asset(
          'assets/images/Vector2.png',
          cacheHeight: 20,
          cacheWidth: 20,
        ),
      ),
    );
  }
}
