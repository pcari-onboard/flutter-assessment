import 'package:assessment/presentation/pages/profile/profile_viewmodels/profile_viewmodel.dart';
import 'package:assessment/presentation/pages/profile/profile_viewmodels/profile_widget_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ProfileViewModel, ProfileWidgetViewModel>(
      builder: (context, value, value2, child) => Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () => {
              value2.edit = true,
              value2.intiControllers(value.contact!),
              value2.bodyController.forward(),
              value2.starScaleController.reverse().whenComplete(
                    () => value2.editController.forward(),
                  ),
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 36.0),
                child: value2.edit
                    ? const SizedBox(
                        height: 20,
                      )
                    : Text(
                        'Edit',
                        style: GoogleFonts.raleway(
                          color: const Color(0XFF32BAA5),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 125.0,
                height: 123.0,
                margin: const EdgeInsets.only(top: 7.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(value.contact!.avatar!),
                  ),
                  border: Border.all(
                    width: 5,
                    color: const Color(0XFF32BAA5),
                  ),
                  borderRadius: BorderRadius.circular(200.0),
                ),
              ),
              RotationTransition(
                turns: value2.animation,
                child: Container(
                  width: 125.0,
                  height: 123.0,
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                  ),
                  child: Stack(
                    children: [
                      FadeTransition(
                        opacity: value2.starScaleAnimation,
                        child: FadeTransition(
                          opacity: value2.starAnimation,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              'assets/images/Vector.png',
                              cacheWidth: 27,
                              cacheHeight: 25,
                            ),
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: value2.editAnimation,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            'assets/images/edit2.png',
                            cacheWidth: 27,
                            cacheHeight: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
