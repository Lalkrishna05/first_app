import 'dart:convert';

import 'package:first_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

class contactpage extends StatefulWidget {
  const contactpage({super.key});

  @override
  State<contactpage> createState() => _contactpageState();
}

final nameController = TextEditingController();
final subjectController = TextEditingController();
final emailController = TextEditingController();
final messageController = TextEditingController();
Future sendemail() async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const serviceid = "service_zfyqx7x";
  const userid = "Q35qDZ6-N9IxxGWjn";
  const templateid = "template_one86qk";
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "service_id": serviceid,
        "template_id": templateid,
        "user_id": userid,
        "template_params": {
          "name": nameController.text,
          "subject": subjectController.text,
          "message": messageController.text,
          "useremail": emailController.text
        }
      }));

  return response.statusCode;
}

class _contactpageState extends State<contactpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contact Form"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(25.0, 40, 25, 0),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: 'Name',
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: subjectController,
                decoration: InputDecoration(
                    icon: Icon(Icons.subject_rounded),
                    hintText: 'subject',
                    labelText: 'subject'),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Email',
                    labelText: 'Email'),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                    icon: Icon(Icons.message),
                    hintText: 'Message',
                    labelText: 'Message'),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    sendemail();
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: Text(
                    "send",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
