import 'package:flutter/material.dart';

import '../utils/routes.dart';

// ignore: camel_case_types
class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}


class _loginpageState extends State<loginpage> {
  String name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2));

    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/login.png", fit: BoxFit.fill),
              const SizedBox(
                height: 25.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                          fillColor: Colors.blue,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Atleast 6 letters is required";
                            }
                            return null;
                          }),
                    ],
                  )),
              const SizedBox(
                height: 40.0,
              ),
              Material(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(changebutton ? 40 : 8),

                child: InkWell(
                  splashColor: Colors.blueGrey,
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changebutton ? 50 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    child: changebutton
                        ? Icon(Icons.done, color: Colors.white)
                        : Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                  ),
                ),

                // ElevatedButton(
                //   style: TextButton.styleFrom(
                //     backgroundColor: Colors.deepPurple,
                //     side: const BorderSide(color: Colors.white, width: 1),
                //     textStyle: const TextStyle(
                //         color: Colors.white,
                //         fontSize: 25,
                //         fontStyle: FontStyle.normal),
                //   ),
                //   onPressed: () {
                //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                //   },
                //   child: const Text("Login"),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
