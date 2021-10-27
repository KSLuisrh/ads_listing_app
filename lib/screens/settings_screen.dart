import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Settings'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            ListTile(
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1024px-Circle-icons-profile.svg.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Luis Ramirez'), Text('9996458232')],
                    ),
                  )
                ],
              ),
              trailing: GestureDetector(
                child: Text(
                  'Edit',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'profile');
                },
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.ad_units_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('My Ads'),
                      ],
                    ),
                  )
                ],
              ),
              trailing: GestureDetector(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {
                  // Navigator.pushNamed(context, 'myAds');
                },
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.contacts_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About Us'),
                      ],
                    ),
                  )
                ],
              ),
              trailing: GestureDetector(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
