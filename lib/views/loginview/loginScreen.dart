import 'package:auvnet_internship/components/defultBtn.dart';
import 'package:auvnet_internship/components/input_field.dart';
import 'package:auvnet_internship/consts/colors.dart';
import 'package:auvnet_internship/consts/reusewidgets.dart';
import 'package:auvnet_internship/views/HomeView/homeScreen.dart';
import 'package:auvnet_internship/views/loginview/cubit/cubite.dart';
import 'package:auvnet_internship/views/loginview/cubit/states.dart';
import 'package:auvnet_internship/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return SafeArea(
      child: BlocProvider(
        create: (context) => LoginCubite(),
        child: BlocConsumer<LoginCubite, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(28.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(65.0),
                      child: Center(
                        child: Image.asset(
                          'assets/cart.png!bw700',
                          width: 300,
                        ),
                      ),
                    ),
                    const Text(
                      "Login",
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
                        key: formKey,
                        child: Column(
                          children: [
                            Input_fireld(
                              control: email,
                              label: "Enter Your Email",
                              prficon: Icon(Icons.person),
                              type: TextInputType.text,
                            ),
                            Input_fireld(
                              control: password,
                              type: TextInputType.text,
                              label: "Enter Your Password",
                              secure: true,
                              prficon: Icon(Icons.lock),
                              saficon: Icon(Icons.visibility),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account"),
                                TextButton(
                                    onPressed: () {
                                      NavigateTo(context, RegisterScreen());
                                    },
                                    child: Text(
                                      "Register",
                                      style: TextStyle(color: appColor),
                                    )),
                              ],
                            ),
                            defultBtn(
                              fn: () {
                                NavigateTo(context, HomeView());
                              },
                              Txt: "Login",
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
