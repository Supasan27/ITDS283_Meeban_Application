import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stroke_text/stroke_text.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAE7),
      body: Stack(
        children: [
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Center(
              child: StrokeText(
                text: 'Login',
                textStyle: TextStyle(
                  fontSize: 64,
                  color: Color(0xFFFFFDFD),
                ),
                strokeColor: Color(0xFFD2001A),
                strokeWidth: 6,
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Image(
              image: AssetImage('images/LogIn.png'),
              height: 250,
            ),
          ),
          Positioned(
            top: 500,
            left: 20,
            right: 20,
            child: FormBuilder(
              key: _formKey,
              initialValue: {'username': '', 'password': ''},
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 235, bottom: 5),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 210, 0, 25),
                      ),
                    ),
                  ),
                  Container(
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
                    child: FormBuilderTextField(
                      name: 'Email',
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: 'please insert email'),
                        FormBuilderValidators.email(context),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(right: 200, bottom: 5),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 210, 0, 25),
                      ),
                    ),
                  ),
                  Container(
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
                    child: FormBuilderTextField(
                      name: 'password',
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: 'please insert password'),
                        FormBuilderValidators.minLength(context, 8,
                            errorText: 'min length 8 character'),
                      ]),
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: 155,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/home');
                        } else {
                          print("validation failed");
                        }
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 210, 0, 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Login',
                          style: TextStyle(
                            color: Color.fromARGB(255, 239, 239, 239),
                            fontSize: 24,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
