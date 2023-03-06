import 'package:flutter/material.dart';

class UserWidgetViewmodel extends ChangeNotifier {
  bool? _isAll = true;

  bool? get isAll => _isAll;

  set isAll(bool? value) {
    _isAll = value;
    notifyListeners();
  }

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  late final TextEditingController _searchController = TextEditingController();

  TextEditingController getSearchController() => _searchController;

  String get searchController => _searchController.text;

  set searchController(String value) {
    _searchController.text = value;
    _searchController.selection = TextSelection.fromPosition(
        TextPosition(offset: _searchController.text.length));
    notifyListeners();
  }

  late TickerProvider ticker;
  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: ticker,
  );
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn,
  );

  late final FocusNode focusNode = FocusNode()
    ..addListener(
      () {
        if (focusNode.hasFocus) {
          // controller2.value = 0;
          controller.forward();
        } else {
          controller.value = 0;
          searchController = '';
          // controller2.forward();
        }
      },
    );
}
