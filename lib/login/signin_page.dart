import 'package:flutter/material.dart';
import 'package:medical/API/apis.dart';
import 'package:medical/NonNavBarPages/forgot_password_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String role = 'patient';
  String email = '';
  String password = '';
  String age = '';
  String address = '';
  bool signIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png',
                width: 150, height: 150), // Add your logo image
            Form(
              key: formKey,
              child: signIn == true
                  ? Column(
                      children: [
                        RoundedTextField(
                          key: ValueKey('email'),
                          hintText: 'Enter your email',
                          onSaved: (value) {
                            setState(() {
                              email = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid email';
                            } else {
                              return null;
                            }
                          },
                        ),
                        RoundedTextField(
                          key: ValueKey('password'),
                          hintText: 'Enter your password',
                          obscureText: true,
                          onSaved: (value) {
                            setState(() {
                              password = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid password';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  signIn = false;
                                });
                              },
                              child: Text('Sign Up'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    APIs.signIn(email, password, context);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgotPasswordPage()));
                          },
                          child: Text(
                            'Forgot Password',
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        RoundedTextField(
                          key: ValueKey('name'),
                          hintText: 'Name',
                          onSaved: (value) {
                            setState(() {
                              name = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                        ),
                        RoundedTextField(
                          key: ValueKey('age'),
                          hintText: 'Age',
                          onSaved: (value) {
                            setState(() {
                              age = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid age';
                            } else {
                              return null;
                            }
                          },
                        ),
                        RoundedTextField(
                          key: ValueKey('address'),
                          hintText: 'Address',
                          onSaved: (value) {
                            setState(() {
                              address = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid address';
                            } else {
                              return null;
                            }
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
                        RoundedTextField(
                          key: ValueKey('email'),
                          hintText: 'Enter your email',
                          onSaved: (value) {
                            setState(() {
                              email = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid email';
                            } else {
                              return null;
                            }
                          },
                        ),
                        RoundedTextField(
                          key: ValueKey('password'),
                          hintText: 'Enter your password',
                          obscureText: true,
                          onSaved: (value) {
                            setState(() {
                              password = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid password';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  signIn = true;
                                });
                              },
                              child: Text('Sign In'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    APIs.signUp(email, password, name, age,
                                        address, role, context);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  final ValueKey? key;

  RoundedTextField({
    required this.key,
    required this.hintText,
    this.obscureText = false,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: key,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
