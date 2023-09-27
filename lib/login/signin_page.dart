// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medical/API/apis.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String role = 'patient';
  String email = '';
  String password = '';
  bool signIn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: signIn == true
            ? Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter valid email';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        email = value!;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value!;
                      });
                    },
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            signIn = false;
                          });
                        },
                        child: Text('Sign Up'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            APIs.signIn(email, password, context);
                          }
                        },
                        child: Text(
                          'Login',
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  TextFormField(
                    key: ValueKey('name'),
                    decoration: InputDecoration(
                      hintText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter valid name';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        name = value!;
                      });
                    },
                  ),
                  Column(
                    children: [
                      RadioListTile(
                        title: Text('Doctor'),
                        value: 'Doctor',
                        groupValue: role,
                        onChanged: (value) {
                          setState(() {
                            role = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  RadioListTile(
                    title: Text('Patient'),
                    value: 'Patient',
                    groupValue: role,
                    onChanged: (value) {
                      setState(() {
                        role = value!;
                      });
                    },
                  ),
                  TextFormField(
                    key: ValueKey('email'),
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter valid email';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        email = value!;
                      });
                    },
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value!;
                      });
                    },
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            signIn = true;
                          });
                        },
                        child: Text('Sign In'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            APIs.signUp(email, password, name, role, context);
                          }
                        },
                        child: Text(
                          'SignUp',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
