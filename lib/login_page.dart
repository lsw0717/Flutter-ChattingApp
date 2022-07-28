import 'package:chattingapp/palette.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //회원 가입 screen을 보여주기 위한 FLAG
  bool isSignUpScreen = true;
  //firebase authentication 사용하기 위한 인스턴스 생성
  final _authentication = FirebaseAuth.instance;

  //Form - TextFormField 입력한 text 관리하기 위한 state들
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  //Form의 모든TextFormField의 Validation == true 이면, 입력한 모든 text 저장하기.
  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                          style: TextStyle(
                              letterSpacing: 1.0, color: Colors.white),
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
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20),
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
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      key: ValueKey(1),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 4) {
                                          return 'Please enter at least 4 characters';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          userEmail = value!;
                                        });
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          userEmail = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email),
                                          iconColor: Palette.iconColor,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textColor1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textColor1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35))),
                                          hintText: 'User Email',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Palette.textColor1),
                                          contentPadding: EdgeInsets.all(10)),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      //텍스트 * 표시로 바꿔줌
                                      obscureText: true,
                                      key: ValueKey(2),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 6) {
                                          return 'Password must be at least 7 characters longs';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          userPassword = value!;
                                        });
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          userPassword = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.password),
                                          iconColor: Palette.iconColor,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textColor1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textColor1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35))),
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Palette.textColor1),
                                          contentPadding: EdgeInsets.all(10)),
                                    ),
                                  ],
                                )),
                          ),
                        if (isSignUpScreen == true)
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      key: ValueKey(3),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 4) {
                                          return 'Please enter at least 4 characters';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          userName = value!;
                                        });
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          userName = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              Icon(Icons.account_circle),
                                          iconColor: Palette.iconColor,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textColor1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textColor1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35))),
                                          hintText: 'User Name',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Palette.textColor1),
                                          contentPadding: EdgeInsets.all(10)),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      //키보드 email 입력하기 쉬운 키보드로 바꿔줌
                                      keyboardType: TextInputType.emailAddress,
                                      key: ValueKey(4),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !value.contains('@')) {
                                          return 'Please enter a valid email address';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          userEmail = value!;
                                        });
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          userEmail = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.mail),
                                          iconColor: Palette.iconColor,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textColor1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textColor1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35))),
                                          hintText: 'User Email',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Palette.textColor1),
                                          contentPadding: EdgeInsets.all(10)),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      //텍스트 * 표시로 바꿔줌
                                      obscureText: true,
                                      key: ValueKey(5),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 6) {
                                          return 'Password must be at least 7 characters long';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          userPassword = value!;
                                        });
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          userPassword = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.password),
                                          iconColor: Palette.iconColor,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textColor1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textColor1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35))),
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Palette.textColor1),
                                          contentPadding: EdgeInsets.all(10)),
                                    ),
                                  ],
                                )),
                          )
                      ],
                    ),
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
                      onTap: () async {
                        //회원가입
                        if (isSignUpScreen) {
                          //Validation 여부 확인
                          _tryValidation();
                          //회원가입 로직
                          try {
                            final newUser = await _authentication
                                .createUserWithEmailAndPassword(
                              email: userEmail,
                              password: userPassword,
                            );
                            newUser.user?.updateDisplayName(userName);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                  'The account already exists for that email.');
                            }
                          }
                        }
                        //로그인
                        if (!isSignUpScreen) {
                          //Validation 여부 확인
                          _tryValidation();
                          try {
                            final newUser = await _authentication
                                .signInWithEmailAndPassword(
                                    email: userEmail, password: userPassword);
                            if (newUser.user != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(context, '/chat_page');
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        }
                      },
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
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: !isSignUpScreen
                  ? MediaQuery.of(context).size.height - 155
                  : MediaQuery.of(context).size.height - 125,
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
      ),
    );
  }
}
