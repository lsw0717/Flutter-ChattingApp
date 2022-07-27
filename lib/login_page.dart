import 'package:chattingapp/palette.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //회원 가입 screen을 보여주기 위한 FLAG
  bool isSignUpScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          //배경
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/login_background.png'))),
                child: Container(
                  padding: EdgeInsets.only(top: 90, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Welcome',
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Colors.white),
                          children: [
                            TextSpan(
                              text: !isSignUpScreen
                                  ? ' back !'
                                  : ' to Chatting App',
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        !isSignUpScreen
                            ? 'SignIn To Continue'
                            : 'SignUp To Continue',
                        style:
                            TextStyle(letterSpacing: 1.0, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
          //텍스트 폼
          AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: 180,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                padding: EdgeInsets.all(20),
                height: !isSignUpScreen ? 250 : 280,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUpScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignUpScreen == false
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignUpScreen == false)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.grey,
                                ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUpScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'SIGNUP',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignUpScreen == true
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignUpScreen == true)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.grey,
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignUpScreen == false)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                            child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  iconColor: Palette.iconColor,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  hintText: 'User Name',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Palette.textColor1),
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  iconColor: Palette.iconColor,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  hintText: 'User Name',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Palette.textColor1),
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                          ],
                        )),
                      ),
                    if (isSignUpScreen == true)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                            child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  iconColor: Palette.iconColor,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  hintText: 'User Name',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Palette.textColor1),
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  iconColor: Palette.iconColor,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  hintText: 'User Name',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Palette.textColor1),
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  iconColor: Palette.iconColor,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  hintText: 'User Name',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Palette.textColor1),
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                          ],
                        )),
                      )
                  ],
                ),
              )),
          //로그인 버튼
          AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: !isSignUpScreen ? 400 : 430,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: const [Colors.black, Colors.grey],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 1))
                          ]),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ),
              )),
          //구글 로그인 버튼
          Positioned(
            top: MediaQuery.of(context).size.height - 125,
            left: 0,
            right: 0,
            child: Column(children: [
              Text('or SignUp with'),
              SizedBox(
                height: 10,
              ),
              TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(155, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Palette.googleColor),
                  icon: Icon(Icons.add),
                  label: Text('Google'))
            ]),
          )
        ],
      ),
    );
  }
}
