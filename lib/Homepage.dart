import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stroke_text/stroke_text.dart';

import 'AdoptionPage.dart';
import 'DonationPage.dart';
import 'ShopPage.dart';

class CatBreed {
  final String name;
  final String country;
  final String imageUrl;

  CatBreed({required this.name, required this.country, required this.imageUrl});

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    final imageUrl = _getImageUrl(json['breed']);
    return CatBreed(
      name: json['breed'],
      country: json['country'],
      imageUrl: imageUrl,
    );
  }

  static String _getImageUrl(String breed) {
    switch (breed) {
      case 'Abyssinian':
        return 'https://www.thesprucepets.com/thmb/MigiLYeVSJcj0zkNVkJ--rALMZI=/2121x0/filters:no_upscale():strip_icc()/GettyImages-165827729-efc11c02690f457a81ef6ccbfa8eb34d.jpg';
      case 'American Bobtail':
        return 'https://www.petfinder.com/sites/default/files/images/content/American-Bobtail-01.jpg';
      case 'American Curl':
        return 'https://i.pinimg.com/736x/94/0f/08/940f08254764f5fbbe391bbc9acbb6e0--special-pictures-the-americans.jpg';
      case 'American Shorthair':
        return 'https://petkeen.com/wp-content/uploads/2022/05/american-shorthair-cat-family_Top-Photo-Engineer-Shutterstock.jpg';
      case 'American Wirehair':
        return 'https://cdn-images.vetstreet.com/7b/f7/b2fffd5443fdb8055221fe5c0492/American-Wirehair-AP-CHJO3K-645sm3614.jpg';
      case 'Arabian Mau':
        return 'https://www.cat-breeds.com/wp-content/uploads/Arabian-Mau.jpg';
      case 'Australian Mist':
        return 'https://www.purina.com.au/-/media/project/purina/main/breeds/cat/cat_australian-mist_desktop.jpg?h=475&la=en&w=825&hash=3223A0BF8F94A2226832E8C7A6C35814';
      case 'Asian':
        return 'https://media.graphassets.com/resize=height:404,width:1280/output=format:webp/KDbK2BgQDu2r0qLZfJlS?width=1280';
      case 'Asian Semi-longhair':
        return 'https://www.thegreatcat.org/wp-content/uploads/2020/05/Australian-Tiffanie.3.jpg';
      case 'Aegean':
        return 'https://t3.ftcdn.net/jpg/05/30/53/44/360_F_530534434_i6lvima4eo0Oo9IhxOQniWar28SyPHXX.jpg';
      default:
        return '';
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CatBreed> _breeds = [];
  int _selectedIndex = 0;

  Future<void> _getBreeds() async {
    final response =
        await http.get(Uri.parse('https://catfact.ninja/breeds?limit=10'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final breedsJson = data['data'];
      final breeds = <CatBreed>[];
      for (final breedJson in breedsJson) {
        final breed = CatBreed.fromJson(breedJson);
        breeds.add(breed);
      }
      setState(() {
        _breeds = breeds;
      });
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  @override
  void initState() {
    super.initState();
    _getBreeds();
  }

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
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 40.0),
            child: StrokeText(
              text: 'CATS BREED',
              textStyle: TextStyle(
                fontSize: 60,
                color: Color(0xFFFFFDFD),
              ),
              strokeColor: Color(0xFFD2001A),
              strokeWidth: 6,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _breeds.length,
              itemBuilder: (context, index) {
                final breed = _breeds[index];
                return ListTile(
                  leading: Image.network(
                    breed.imageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(breed.name),
                  subtitle: Text(breed.country),
                );
              },
            ),
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
