import 'package:flutter/material.dart';

class EditProfileUI extends StatefulWidget {
  final Map? profile;

  const EditProfileUI({Key? key, this.profile}) : super(key: key);

  @override
  _EditProfileUIState createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  @override
  Widget build(BuildContext context) {
    Map? profileData = widget.profile;

    String firstName = profileData?['first_name'] ?? '';
    String lastName = profileData?['last_name'] ?? '';
    String email = profileData?['email'] ?? '';
    String avatar = profileData?['avatar'] ?? '';

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
      body: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 15,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF32BAA5), width: 4),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          )
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
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF32BAA5)),
                            color: Color(0xFF32BAA5),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              buildTextField(firstName, "First Name"),
              buildTextField(lastName, "Last Name"),
              buildTextField(email, "Email"),
              saveChangesButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String value, String textHint) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16, left: 10, right: 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: Color(0xFF32BAA5),
              width: 2,
            ),
          ),
          labelText: textHint,
          labelStyle: TextStyle(
            color: Color(0xFF32BAA5),
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: 'Montserrat',
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 24, 0, 24),
        ),
        controller: TextEditingController(text: value),
      ),
    );
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
          'Save Changes',
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
