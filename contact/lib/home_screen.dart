import 'package:contact/edit_profile.dart';
import 'package:contact/send_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = '';
  List<Map<String, dynamic>> items = [];
  Set<int> starredItems = Set<int>(); // Added set to track starred items
  List<Map<String, dynamic>> filteredItems =
      []; // Added set to track starred items

  @override
  void initState() {
    super.initState();
    fetchContact();
  }

  Future<void> fetchContact() async {
    final url = 'https://reqres.in/api/users?page=1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final result = json['data'] as List<dynamic>;
      setState(() {
        items = result.cast<Map<String, dynamic>>();
      });
    } else {
      // Handle error if needed
    }
  }

  void filterContacts(String enteredKeyword) {
    setState(() {
      if (enteredKeyword.isEmpty) {
        // if the search field is empty or only contains white-space, display all users
        filteredItems = items;
      } else {
        enteredKeyword = enteredKeyword.toLowerCase();
        filteredItems = items.where((item) {
          final fullName =
              '${item['first_name']} ${item['last_name']}'.toLowerCase();
          final email = '${item['email']}'.toLowerCase();

          return (fullName.contains(enteredKeyword) ||
              email.contains(enteredKeyword));
        }).toList();
      }

      if (filteredItems.isEmpty) {
        filteredItems = [
          {'result': 'No result'}
        ];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //TextEditingController controller = TextEditingController();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            "My Contacts",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                fetchContact(); // Fetch contacts on refresh
              },
              icon: Icon(
                Icons.refresh,
                size: 25,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 19, right: 19),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                    filterContacts(searchText);
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search Contact',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 180, 184, 184),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(
                      width: 2,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                    top: 13,
                    left: 24,
                    bottom: 13,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 201, 204, 204),
                      width: 2,
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    size: 24,
                    color: Color.fromARGB(255, 201, 204, 204),
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ), // Remove the semicolon here
            ),
            customTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  // All Tab
                  ListView.builder(
                    itemCount: filteredItems.isEmpty
                        ? items.length
                        : filteredItems.length,
                    itemBuilder: (context, index) {
                      if (filteredItems.isNotEmpty &&
                          filteredItems[index]['result'] == 'No result') {
                        // Display a ListTile with 'No result' text
                        return ListTile(
                          title: Text('No result'),
                        );
                      } else {
                        final item = filteredItems.isEmpty
                            ? items[index]
                            : filteredItems[index];
                        final fullName =
                            '${item['first_name']} ${item['last_name']}';
                        final avatarUrl = item['avatar'];
                        final id = item['id'];
                        final isFavorite = starredItems.contains(
                            id); // Check if the ID is in the starredItems set

                        return Slidable(
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (_) {
                                    navigateToEditProfile(context, item);
                                  },
                                  backgroundColor: Color(0xFF32BAA5),
                                  foregroundColor: Color(0xFFF2C94C),
                                  icon: Icons.edit,
                                ),
                                Divider(
                                  indent: 2,
                                ),
                                SlidableAction(
                                  onPressed: (_) {},
                                  backgroundColor: Color(0xFF32BAA5),
                                  foregroundColor: Colors.red,
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Image.network(avatarUrl),
                              trailing: Icon(Icons.chevron_right),
                              onTap: () {
                                navigateToSendEmail(context, item, isFavorite);
                              },
                              title: Row(
                                children: [
                                  Text(fullName),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // Toggle the favorite status based on ID
                                        if (isFavorite) {
                                          starredItems.remove(id);
                                        } else {
                                          starredItems.add(id);
                                        }
                                      });
                                    },
                                    child: Icon(
                                      isFavorite
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: isFavorite ? Colors.yellow : null,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Text(item['email']),
                            ));
                      }
                    },
                  ),
                  // Favorite Tab
                  ListView.builder(
                    itemCount: filteredItems.isEmpty
                        ? items.length
                        : filteredItems.length,
                    itemBuilder: (context, index) {
                      if (filteredItems.isNotEmpty &&
                          filteredItems[index]['result'] == 'No result') {
                        return ListTile(
                          title: Text('No result'),
                        );
                      } else {
                        final item = filteredItems.isEmpty
                            ? items[index]
                            : filteredItems[index];
                        final id = item['id'];
                        final isFavorite = starredItems.contains(
                            id); // Check if the ID is in the starredItems set

                        if (isFavorite) {
                          final fullName =
                              '${item['first_name']} ${item['last_name']}';
                          final avatarUrl = item['avatar'];

                          return Slidable(
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (_) {},
                                  backgroundColor: Color(0xFF32BAA5),
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                ),
                                Divider(color: Colors.black),
                                SlidableAction(
                                  onPressed: (_) {},
                                  backgroundColor: Color(0xFF32BAA5),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Image.network(avatarUrl),
                              trailing: Icon(Icons.chevron_right),
                              title: Row(
                                children: [
                                  Text(fullName),
                                  SizedBox(width: 4),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // Toggle the favorite status based on ID
                                        if (isFavorite) {
                                          starredItems.remove(id);
                                        } else {
                                          starredItems.add(id);
                                        }
                                      });
                                    },
                                    child: Icon(
                                      isFavorite
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: isFavorite ? Colors.yellow : null,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Text(item['email']),
                            ),
                          );
                        } else {
                          return Container(); // Return an empty container if not a favorite
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customTabBar() {
  return Material(
    child: Container(
      height: 70,
      color: Colors.white,
      child: TabBar(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: 10,
        ),
        unselectedLabelColor: Colors.pink,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.pinkAccent,
        ),
        tabs: [
          Tab(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.pinkAccent,
                  width: 1,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text("All"),
              ),
            ),
          ),
          Tab(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.pinkAccent,
                  width: 1,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text("Favourite"),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void navigateToEditProfile(BuildContext context, Map item) {
  final route = MaterialPageRoute(
    builder: (context) => EditProfileUI(profile: item),
  );
  Navigator.push(context, route);
}

void navigateToSendEmail(BuildContext context, Map item, bool isFavorite) {
  final route = MaterialPageRoute(
    builder: (context) => SendEmailUI(profile: item, favorite: isFavorite),
  );
  Navigator.push(context, route);
}
