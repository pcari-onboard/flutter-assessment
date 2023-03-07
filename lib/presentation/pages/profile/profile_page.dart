import 'package:assessment/presentation/pages/profile/profile_viewmodels/profile_viewmodel.dart';
import 'package:assessment/presentation/pages/profile/profile_viewmodels/profile_widget_viewmodel.dart';
import 'package:assessment/presentation/pages/profile/widget/profile_body.dart';
import 'package:assessment/presentation/pages/profile/widget/profile_edit_form.dart';
import 'package:assessment/presentation/pages/profile/widget/profile_header.dart';
import 'package:assessment/presentation/pages/profile/widget/profile_page_shimmer.dart';
import 'package:assessment/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    @PathParam('id') this.id,
    super.key,
    @PathParam('isEdit') this.isEdit,
  });

  final String? id;
  final bool? isEdit;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    context.read<ProfileWidgetViewModel>().ticker = this;
    final data = context.read<ProfileViewModel>().getContact(id: widget.id);

    data.whenComplete(() {
      if (widget.isEdit!) {
        final value2 = context.read<ProfileWidgetViewModel>();
        final value = context.read<ProfileViewModel>();
        value2.intiControllers(value.contact!);
        value2.bodyController.forward();
        value2.starScaleController.reverse().whenComplete(
              () => value2.editController.forward(),
            );
        WidgetsBinding.instance.addPostFrameCallback((_) {
          value2.edit = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // context.read<ProfileWidgetViewModel>().controller.stop();
    // context.read<ProfileWidgetViewModel>().controller.addListener(() {
    // });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<ProfileWidgetViewModel>().loading == false) {
      context.watch<ProfileWidgetViewModel>().controller.forward();
    }
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0XFF32BAA5),
        toolbarHeight: 78.0,
        title: Text(
          'Profile',
          style: GoogleFonts.raleway(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        shadowColor: Colors.transparent,
        leading: InkWell(
          onTap: () =>
              context.router.pop(context.read<ProfileViewModel>().contact),
          child: Image.asset(
            'assets/images/Vector1.png',
            cacheWidth: 11,
            cacheHeight: 22,
          ),
        ),
      ),
      body: Consumer2<ProfileViewModel, ProfileWidgetViewModel>(
        builder: (context, value, value2, child) {
          return value2.loading
              ? const ProfilePageShimmer()
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: const [
                      ProfileHeader(),
                      ProfileEditForm(),
                      ProfileBody()
                    ],
                  ),
                );
        },
      ),
    );
  }
}
