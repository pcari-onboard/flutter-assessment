import 'package:assessment/presentation/pages/my_contacts/viewmodels/user_viewmodel.dart';
import 'package:assessment/presentation/pages/my_contacts/viewmodels/user_widget_viewmodel.dart';
import 'package:assessment/presentation/pages/my_contacts/widgets/my_contacts_list_view.dart';
import 'package:assessment/presentation/pages/my_contacts/widgets/my_contacts_empty.dart';
import 'package:assessment/presentation/pages/my_contacts/widgets/my_contacts_list_view_actions.dart';
import 'package:assessment/presentation/pages/my_contacts/widgets/my_contacts_search_bar.dart';
import 'package:assessment/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:assessment/presentation/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  createState() => _UserPage();
}

class _UserPage extends State<UserPage> with TickerProviderStateMixin {
  @override
  void initState() {
    context.read<UserViewmodel>().getAllUsers()
      ..whenComplete(() => context.read<UserViewmodel>().getFavourite());
    super.initState();
  }

  InputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(100.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    context.read<UserWidgetViewmodel>().ticker = this;
    return Scaffold(
      backgroundColor: const Color(0XFFE6E6E6),
      appBar: AppBar(
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
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const CustomFloatingActionButton(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Consumer2<UserWidgetViewmodel, UserViewmodel>(
            builder: (context, value, value2, child) => Column(
              children: [
                MyContactsSearchBar(border: border),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: value.loading
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              const MyContactsListViewActions(),
                              (value2.users!.isEmpty && value.isAll!) ||
                                      (!value.isAll! &&
                                          value2.favourite.favourite.isEmpty)
                                  ? const MyContactsEmpty()
                                  : const MyContactsListView(),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
