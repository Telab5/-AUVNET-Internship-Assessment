import 'package:auvnet_internship/components/input_field.dart';
import 'package:auvnet_internship/consts/colors.dart';
import 'package:auvnet_internship/consts/reusewidgets.dart';
import 'package:auvnet_internship/views/HomeView/homeScreen.dart';
import 'package:auvnet_internship/views/loginview/loginScreen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(65.0),
                  child: Center(
                    child: Image.asset(
                      'assets/cart.png!bw700',
                      width: 150,
                    ),
                  ),
                ),
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 24,
                    color: appColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                    child: Column(
                  children: [
                    Input_fireld(
                      type: TextInputType.text,
                      label: "Enter Your usernaem",
                      prficon: Icon(Icons.person),
                    ),
                    Input_fireld(
                      type: TextInputType.emailAddress,
                      label: "Enter Your Email",
                      prficon: Icon(Icons.mail),
                    ),
                    Input_fireld(
                      type: TextInputType.text,
                      secure: true,
                      label: "Enter Your Password",
                      prficon: Icon(Icons.lock),
                      saficon: Icon(Icons.visibility),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Have an account"),
                        TextButton(
                            onPressed: () {
                              NavigateTo(context, LoginScreen());
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: appColor),
                            )),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        NavigateTo(context, HomeView());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.circular(24)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 48.0, vertical: 18),
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
