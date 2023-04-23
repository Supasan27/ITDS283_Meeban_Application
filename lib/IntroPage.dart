import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAE7),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Image.asset(
                  'images/Logo.png',
                  width: 400,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 110,
            child: Center(
              child: Image.asset(
                'images/Intropic.png',
                width: 350,
              ),
            ),
          ),
          Positioned(
            bottom: 145,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                     Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 210, 0, 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(155, 60),
                  ),
                  child: Text('Log In',
                      style: TextStyle(
                        color: Color.fromARGB(255, 239, 239, 239),
                        fontSize: 20,
                      )),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 210, 0, 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(155, 60),
                  ),
                  child: Text('Register',
                      style: TextStyle(
                          color: Color.fromARGB(255, 239, 239, 239),
                          fontSize: 20,
                          fontFamily: 'Kavoon')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
