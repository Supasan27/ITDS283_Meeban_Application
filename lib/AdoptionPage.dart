import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

import 'DonationPage.dart';
import 'Homepage.dart';
import 'ShopPage.dart';

class AdoptionPage extends StatefulWidget {
  @override
  _AdoptionPageState createState() => _AdoptionPageState();
}

class _AdoptionPageState extends State<AdoptionPage> {
  int _selectedIndex = 1;

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
      backgroundColor: const Color(0xFFFFFAE7),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 20.0),
            child: StrokeText(
              text: 'ADOPTION',
              textStyle: TextStyle(
                fontSize: 64,
                color: Color(0xFFFFFDFD),
              ),
              strokeColor: Color(0xFFD2001A),
              strokeWidth: 6,
            ),
          ),
          SizedBox(height: 7.0),
          Container(
            width: 360,
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 125, 36, 46),
            ),
            child: Center(
              child: Text(
                "May you find a beloved companion who will stay by your side always.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          AdoptionCard(
            name: 'Salit',
            breed: 'Siamese (Asia cat)',
            gender: 'Male',
            age: '3 month',
            imageUrl:
                'https://pbs.twimg.com/media/FuPEicTaIAEFIfE?format=jpg&name=large',
            hasGottenVaccine: true,
          ),
          AdoptionCard(
            name: 'Charcoal',
            breed: 'Siamese (Asia cat)',
            gender: 'Male',
            age: '2 month',
            imageUrl:
                'https://pbs.twimg.com/media/FuNeLXoaUAEURvP?format=png&name=small',
            hasGottenVaccine: true,
          ),
          AdoptionCard(
            name: 'Milk',
            breed: 'Siamese (Asia cat)',
            gender: 'Female',
            age: '1 month',
            imageUrl:
                'https://pbs.twimg.com/media/FuNYMYrakAESmMv?format=jpg&name=large',
            hasGottenVaccine: false,
          ),
          AdoptionCard(
            name: 'Kitty',
            breed: 'Siamese (Asia cat)',
            gender: 'Female',
            age: '1 month',
            imageUrl:
                'https://pbs.twimg.com/media/FuGAur4aEAAo09l?format=jpg&name=large',
            hasGottenVaccine: false,
          ),
        ],
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

class AdoptionCard extends StatelessWidget {
  final String name;
  final String breed;
  final String gender;
  final String age;
  final String imageUrl;
  final bool hasGottenVaccine;

  AdoptionCard({
    required this.name,
    required this.breed,
    required this.gender,
    required this.age,
    required this.imageUrl,
    required this.hasGottenVaccine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        border:
            Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 4.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Breed: $breed',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Gender: $gender',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Age: $age',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Has gotten vaccine: ${hasGottenVaccine ? 'Yes' : 'No'}',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 2.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 100.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD2001A),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        'Adopt',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFFFFDE00),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
