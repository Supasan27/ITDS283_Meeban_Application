import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("User");

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _userCollection.add({
          'Full Name': _nameController.text,
          'Email': _emailController.text,
          'Phone Number': _phoneController.text,
          'Password': _passwordController.text,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User created successfully')),
        );
        _nameController.clear();
        _emailController.clear();
        _phoneController.clear();
        _passwordController.clear();
        Navigator.pushNamed(context, '/login');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create user')),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Stack(children: [
              Align(
                alignment: AlignmentDirectional(0.03, -0.75),
                child: SvgPicture.asset('images/account_circle.svg',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    color: Color.fromARGB(255, 210, 0, 25)),
              ),
              Align(
                  alignment: AlignmentDirectional(0, 0.4),
                  child: Container(
                      width: 350,
                      height: 450,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFCF2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(right: 200, bottom: 5),
                          child: Text(
                            "Full Name",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 210, 0, 25),
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          width:
                              300, // set the width of the container to adjust the width of the text field
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFFF9F9F9),
                            border: Border.all(
                              color: Color(0xFFFFDE00),
                              width: 4.5, // adjust the width of the border
                            ),
                          ),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(right: 245, bottom: 5),
                          child: Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 210, 0, 25),
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFFF9F9F9),
                            border: Border.all(
                              color: Color(0xFFFFDE00),
                              width: 4.5,
                            ),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(right: 172, bottom: 5),
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 210, 0, 25),
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFFF9F9F9),
                            border: Border.all(
                              color: Color(0xFFFFDE00),
                              width: 4.5,
                            ),
                          ),
                          child: TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(right: 200, bottom: 5),
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 210, 0, 25),
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFFF9F9F9),
                            border: Border.all(
                              color: Color(0xFFFFDE00),
                              width: 4.5,
                            ),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: _submitForm,
                          child:
                              Text('Register', style: TextStyle(fontSize: 20.0)),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 40.0),
                            backgroundColor: Color.fromARGB(255, 210, 0, 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ])))
            ])));
  }
}
