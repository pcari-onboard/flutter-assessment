import 'package:assessment/domain/entities/contact_entities/contact_entity.dart';
import 'package:flutter/widgets.dart';

class ProfileWidgetViewModel extends ChangeNotifier {
  bool _loading = true;
  bool _loadingEdit = false;

  bool get loadingEdit => _loadingEdit;

  set loadingEdit(bool value) {
    _loadingEdit = value;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _edit = false;

  bool get edit => _edit;

  set edit(bool value) {
    _edit = value;
    notifyListeners();
  }

  void intiControllers(ContactEntity contact) {
    firstNameController.text = contact.first_name!;
    lastNameController.text = contact.last_name!;
    emailController.text = contact.email!;
  }

  late TextEditingController _firstNameController = TextEditingController();

  TextEditingController get firstNameController => _firstNameController;

  set firstNameController(TextEditingController value) {
    _firstNameController = value;
  }

  late TextEditingController _lastNameController = TextEditingController();

  TextEditingController get lastNameController => _lastNameController;

  set lastNameController(TextEditingController value) {
    _lastNameController = value;
  }

  late TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  set emailController(TextEditingController value) {
    _emailController = value;
  }

  late TickerProvider? _ticker;

  TickerProvider? get ticker => _ticker;

  set ticker(TickerProvider? value) {
    _ticker = value;
  }

  late final AnimationController controller = AnimationController(
    vsync: ticker!,
    duration: const Duration(milliseconds: 1500),
  );

  late Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeOutBack,
  );

  late final AnimationController starController = AnimationController(
    vsync: ticker!,
    duration: const Duration(milliseconds: 1500),
  )..forward();

  late Animation<double> starAnimation = CurvedAnimation(
    parent: starController,
    curve: Curves.easeOutBack,
  );

  late final AnimationController starScaleController = AnimationController(
    vsync: ticker!,
    duration: const Duration(milliseconds: 500),
    value: 1,
  );

  late Animation<double> starScaleAnimation = CurvedAnimation(
    parent: starScaleController,
    curve: Curves.easeOutBack,
  );

  late final AnimationController editController = AnimationController(
    vsync: ticker!,
    duration: const Duration(milliseconds: 500),
    value: 0,
  );

  late Animation<double> editAnimation = CurvedAnimation(
    parent: editController,
    curve: Curves.easeOutBack,
  );

  late final AnimationController inputsController = AnimationController(
    vsync: ticker!,
    duration: const Duration(milliseconds: 500),
  )..addListener(
      () {
        if (inputsController.value > 0.5 && edit) {
          inputsController2.forward();
        } else if (inputsController.value < 0.5 && !edit) {
          bodyController.reverse();
        }
      },
    );

  late final AnimationController inputsController2 = AnimationController(
    vsync: ticker!,
    duration: const Duration(milliseconds: 500),
  )..addListener(
      () {
        if (inputsController2.value > 0.5 && edit) {
          inputsController3.forward();
        } else if (inputsController2.value < 0.5 && !edit) {
          inputsController.reverse();
        }
      },
    );

  late final AnimationController inputsController3 = AnimationController(
    vsync: ticker!,
    duration: const Duration(milliseconds: 500),
  )..addListener(
      () {
        if (inputsController3.value > 0.5 && edit) {
          inputsController4.forward();
        } else if (inputsController3.value < 0.5 && !edit) {
          inputsController2.reverse();
        }
      },
    );

  late final AnimationController bodyController = AnimationController(
    vsync: ticker!,
    duration: const Duration(milliseconds: 500),
  )..addListener(() {
      if (bodyController.value > 0.5 && edit) {
        inputsController.forward();
      }
    });

  late final AnimationController inputsController4 = AnimationController(
    vsync: ticker!,
    duration: const Duration(milliseconds: 500),
  )..addListener(() {
      if (inputsController4.value < 0.5 && !edit) {
        inputsController3.reverse();
      }
    });

  late Animation<RelativeRect> bodyAnimation = RelativeRectTween(
    begin: RelativeRect.fromSize(
      const Rect.fromLTWH(0, 180, 100, 100),
      const Size(100, 100),
    ),
    end: RelativeRect.fromSize(
      const Rect.fromLTWH(0, 1000, 100, 100),
      const Size(100, 100),
    ),
  ).animate(
    CurvedAnimation(
      parent: bodyController,
      curve: Curves.easeInOut,
    ),
  );
  late Animation<RelativeRect> transition = RelativeRectTween(
    begin: RelativeRect.fromSize(
      const Rect.fromLTWH(-500, 215, 100, 100),
      const Size(100, 100),
    ),
    end: RelativeRect.fromSize(
      const Rect.fromLTWH(0, 215, 100, 100),
      const Size(100, 100),
    ),
  ).animate(
    CurvedAnimation(
      parent: inputsController,
      curve: Curves.easeInOut,
    ),
  );

  late Animation<RelativeRect> transition2 = RelativeRectTween(
    begin: RelativeRect.fromSize(
      const Rect.fromLTWH(-500, 305, 100, 100),
      const Size(100, 100),
    ),
    end: RelativeRect.fromSize(
      const Rect.fromLTWH(0, 305, 100, 100),
      const Size(100, 100),
    ),
  ).animate(
    CurvedAnimation(
      parent: inputsController2,
      curve: Curves.easeInOut,
    ),
  );

  late Animation<RelativeRect> transition3 = RelativeRectTween(
    begin: RelativeRect.fromSize(
      const Rect.fromLTWH(-500, 397, 100, 100),
      const Size(100, 100),
    ),
    end: RelativeRect.fromSize(
      const Rect.fromLTWH(0, 397, 100, 100),
      const Size(100, 100),
    ),
  ).animate(
    CurvedAnimation(
      parent: inputsController3,
      curve: Curves.easeInOut,
    ),
  );

  late Animation<RelativeRect> transition4 = RelativeRectTween(
    begin: RelativeRect.fromSize(
      const Rect.fromLTWH(-500, 200, 100, 100),
      const Size(100, 100),
    ),
    end: RelativeRect.fromSize(
      const Rect.fromLTWH(0, 200, 100, 100),
      const Size(100, 100),
    ),
  ).animate(
    CurvedAnimation(
      parent: inputsController4,
      curve: Curves.easeInOut,
    ),
  );
}
