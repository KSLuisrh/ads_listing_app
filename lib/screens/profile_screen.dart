import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: _profile(context),
      ),
    );
  }

  _profile(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1024px-Circle-icons-profile.svg.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      hintText: 'Full Name',
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      hintText: 'Mobile Number',
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    minimumSize: Size(double.infinity, 50)),
                onPressed: () {
                  // Get.off(Home());
                },
                child: Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Text(
                'Logout',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
