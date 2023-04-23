import 'package:flutter/material.dart';
import 'package:pj_061_087_091/DonationPage.dart';
import 'package:stroke_text/stroke_text.dart';

import 'AdoptionPage.dart';
import 'Homepage.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int _selectedIndex = 2;

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
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAE7),
      body: SafeArea(
        child: Expanded(
          child: Column(
            // your existing code herecrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top +6),
                alignment: Alignment.topCenter,
                child: StrokeText(
                  text: 'SHOP',
                  textStyle: TextStyle(
                    fontSize: 64,
                    color: Color(0xFFFFFDFD),
                  ),
                  strokeColor: Color(0xFF682600),
                  strokeWidth: 6,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xFFBD7A54),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for a product',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductCard(
                    'images/where_are_u.png',
                    'Find ur DOG Cup',
                    150.0,
                  ),
                  _buildProductCard(
                    'images/bagcat.png',
                    'MB HangingBag',
                    220.0,
                  ),
                  _buildProductCard(
                    'images/Mebaan_hoodie.png',
                    'MeBaan Hoodie',
                    350.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
    );
  }
}

Widget _buildProductCard(String imagePath, String name, double price) {
  return Container(
    width: 120.0,
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          imagePath,
          width: 90.0,
          height: 90.0,
        ),
        SizedBox(height: 8.0),
        Text(
          name,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '\฿ $price',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () {},
          child: Text('Buy Now!'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 246, 187, 48),
            textStyle: TextStyle(
              color: Color.fromARGB(255, 240, 57, 57),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
