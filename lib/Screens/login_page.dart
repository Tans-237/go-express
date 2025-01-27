import'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/apple.jpeg"),fit: BoxFit.cover
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35, top: 30),
                  child: Text(
                      "Login",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.5, right: 35, left: 35
                  ),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          prefixIcon: Icon(Icons.account_circle),
                            prefixIconColor: Colors.white,
                          fillColor: Colors.white,
                            hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                          )
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      TextField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          prefixIcon: Icon(Icons.password_rounded),
                            prefixIconColor: Colors.white,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.white, width: 3)
                            )
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                            )
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xFF3D56F0),
                            child: IconButton(
                              iconSize: 30,
                                color: Colors.white,
                                onPressed: (){},
                                icon: Icon(Icons.arrow_forward)
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: (){
                                Navigator.pushNamed(context, 'register');
                              },
                              child: Text(
                                  "Sign Up",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Colors.white
                                ),
                              )
                          ),
                          TextButton(
                              onPressed: (){},
                              child: Text(
                                "forgot password ?",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    color: Colors.white
                                ),
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
