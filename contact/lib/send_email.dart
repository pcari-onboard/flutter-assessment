import 'package:contact/edit_profile.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class SendEmailUI extends StatefulWidget {
  final Map? profile;
  final bool favorite; // Include the boolean here

  const SendEmailUI({Key? key, this.profile, required this.favorite})
      : super(key: key);

  @override
  _SendEmailUIState createState() => _SendEmailUIState();
}

class _SendEmailUIState extends State<SendEmailUI> {
  @override
  Widget build(BuildContext context) {
    Map? profileData = widget.profile;
    bool isFavorite = widget.favorite; // Retrieve the favorite value

    String firstName = profileData?['first_name'] ?? '';
    String lastName = profileData?['last_name'] ?? '';
    String email = profileData?['email'] ?? '';
    String avatar = profileData?['avatar'] ?? '';
    String fullName = firstName + " " + lastName;
    log("$isFavorite");
    log("$profileData");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF32BAA5),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Edit Profile",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          toolbarHeight: 80,
        ),
        body: Column(
          children: [
            SizedBox(height: 20), // Adding the top padding

            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          navigateToEditProfile(context, profileData);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 40, top: 15),
                          child: Text(
                            'Edit',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFF32BAA5), width: 4),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(avatar != null
                                  ? avatar
                                  : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (isFavorite) showFavouriteIcon(),
                      ],
                    ),
                  ),
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        fullName,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      // Add other widgets here
                    ],
                  ),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFFF1F1F1),
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.message,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(height: 8),
                              Text(
                                email,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  saveChangesButton()
                ],
              ),
            ),
          ],
        ));
  }

  Widget saveChangesButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16, left: 10, right: 10, top: 24),
      child: ElevatedButton(
        onPressed: () {
          // Add your onPressed logic here.
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF32BAA5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          minimumSize: Size(349, 50),
        ),
        child: Text(
          'Send Email',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: 'Raleway',
          ),
        ),
      ),
    );
  }
}

class showFavouriteIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        height: 35,
        width: 35,
        child: Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ),
    );
  }
}

void navigateToEditProfile(BuildContext context, Map? profileData) {
  final route = MaterialPageRoute(
    builder: (context) => EditProfileUI(profile: profileData),
  );
  Navigator.push(context, route);
}