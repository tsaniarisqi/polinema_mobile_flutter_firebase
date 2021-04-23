import 'package:firebase/auth.dart';
import 'package:firebase/login_page.dart';
import 'package:firebase/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var authHandler = new Auth();

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
                  _showTitle(),
                  _form(),
                  _registerButton(),
                ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Already have account ?",
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Login here",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // untuk menampilkan title
  Widget _showTitle() {
    return Padding(
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
                ),
              ),
              SizedBox(width: 40),
            ],
          ),
          Text(
            "Register First",
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 36, letterSpacing: 5),
          ),
        ],
      ),
    );
  }

  // widget untuk menampilkan form inputan
  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Enter Email",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter an Email Address';
              } else if (!value.contains('@')) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: TextFormField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Enter Password",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Password';
              } else if (value.length < 6) {
                return 'Password must be atleast 6 characters!';
              }
              return null;
            },
          ),
        ),
      ]),
    );
  }

  // Button untuk register
  Widget _registerButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          authHandler
              .handleSignUp(emailController.text, passwordController.text)
              .then((User user) {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new ProfilePage()));
          }).catchError((e) => print(e));
        },
        child: Text(
          "Register",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Color(0xFF4f4f4f),
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
