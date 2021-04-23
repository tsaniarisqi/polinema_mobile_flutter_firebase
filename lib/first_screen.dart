import 'package:flutter/material.dart';
import 'package:firebase/login_page.dart';
import 'package:firebase/sign_in.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Hello",
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.5,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Divider(
                                thickness: 3,
                                // color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 40),
                          ],
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 36,
                              letterSpacing: 5),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Name",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  // menampilkan nama dan image
                  Card(
                      child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        imageUrl,
                      ),
                    ),
                    title: Text(name),
                  )),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Email",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  // menampilkan email
                  Card(
                      child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.email_outlined),
                    ),
                    title: Text(email),
                  )),
                  //signOutButton
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      onPressed: () {
                        signOutGoogle();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }), ModalRoute.withName('/'));
                      },
                      child: Text(
                        "LogOut",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Color(0xFF4f4f4f),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
