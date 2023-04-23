import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'AdoptionPage.dart';
import 'Homepage.dart';
import 'ShopPage.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        // navigate to Breed page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        // navigate to Adoption page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdoptionPage()),
        );
        break;
      case 2:
        // navigate to Shop page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShopPage()),
        );
        break;
      case 3:
        // navigate to Donation page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DonationPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xFFD2001A),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              label: 'Breed of cat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Find Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'Donation',
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: SingleChildScrollView(
              child: Container(
                width: 331,
                height: 347,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.brown),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Adopt a homeless pet and make a difference!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 7),
                    Text(
                      "     Did you know that millions of pets end up in animal shelters every year? By adopting a pet, you not only save a life, but you also make room for another pet in need. When you donate to animal welfare organizations, you help support the care of these pets and give them a second chance at finding a loving home. Adopt a pet today and make a difference in the world!",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 7),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Donate to a charity",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ))));
  }
}
