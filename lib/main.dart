import 'package:flutter/material.dart';
import 'package:go_express/Screens/event_details_page.dart';
import 'package:go_express/Screens/navbar.dart';
import 'package:go_express/Screens/notificationPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      image: 'assets/images/bus1.jpeg',
      title: 'Welcome',
      description: 'Découvrez notre application et ses fonctionnalités.',
    ),
    OnboardingPage(
      image: 'assets/images/bus2.jpeg',
      title: 'Facilité d\'utilisation',
      description: 'Naviguez facilement grâce à notre interface conviviale.',
    ),
    OnboardingPage(
      image: 'assets/images/bus3.jpeg',
      title: 'Commencez maintenant',
      description: 'Inscrivez-vous pour profiter de toutes nos offres.',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _currentPage++;
      _pageController.jumpToPage(_currentPage);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  Widget _buildIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: _currentPage == index ? 16.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? const Color(0xFF3D56F0) : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_pages[index].image),
                      const SizedBox(height: 20),
                      Text(
                        _pages[index].title,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _pages[index].description,
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pages.length, (index) => _buildIndicator(index)),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton(
              onPressed: _nextPage,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF3D56F0),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Next'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String image;
  final String title;
  final String description;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final events = [
      {
        "Agence":"Touristique",
        "Destination": "Douala - Yaoundé",
        "Date": "12/01/2025 15h37",
        "classe":"Classique",
        "prix":"5000 FCFA",
        "Localisation":"my location",
        "immatriculation":"CE 767 MR",
        "Nombre de place":"15",
        "avatar": "bus2"
      },
      {
        "Agence":"Finex",
        "Destination": "Yaounde - Mbalmayo",
        "Date": "12/09/2025 15h37",
        "classe":"VIP",
        "prix":"7000 FCFA",
        "Localisation":"my location",
        "immatriculation":"CE 767 MR",
        "Nombre de place":"15",
        "avatar": "bus1"
      },
      {
        "Agence":"Galaxie",
        "Destination": "Mbalmayo - Yaoundé",
        "Date": "23/01/2024 15h00",
        "classe":"VIP",
        "prix":"1000 FCFA",
        "Localisation":"my location",
        "immatriculation":"CE 767 MR",
        "Nombre de place":"15",
        "avatar": "bus3"
      },
      {
        "Agence":"United epress",
        "Destination": "Douala - Yaoundé",
        "Date": "12/01/2025 15h37",
        "classe":"VIP",
        "prix":"7000 FCFA",
        "Localisation":"my location",
        "immatriculation":"CE 797 MR",
        "Nombre de place":"30",
        "avatar": "bus1"
      },
      {
        "Agence":"Touristique",
        "Destination": "Douala - Yaoundé",
        "Date": "12/01/2025 15h37",
        "classe":"Classique",
        "prix":"5000 FCFA",
        "Localisation":"my location",
        "immatriculation":"CE 767 MR",
        "Nombre de place":"15",
        "avatar": "bus2"
      },
      {
        "Agence":"Regionale",
        "Destination": "Yaoundé - Mbalmayo",
        "Date": "02/11/2024 15h37",
        "classe":"Classique",
        "prix":"700 FCFA",
        "Localisation":"my location",
        "immatriculation":"CE 667 MR",
        "Nombre de place":"19",
        "avatar": "bus3"
      },
      {
        "Agence":"Buca voyage",
        "Destination": "Douala - Yaoundé",
        "Date": "12/01/2025 15h37",
        "classe":"Classique",
        "prix":"5000 FCFA",
        "Localisation":"my location",
        "immatriculation":"CE 767 MR",
        "Nombre de place":"15",
        "avatar": "bus2"
      },
      {
        "Agence":"Touristique",
        "Destination": "Douala - Yaoundé",
        "Date": "12/01/2025 15h37",
        "classe":"Classique",
        "prix":"5000 FCFA",
        "Localisation":"my location",
        "immatriculation":"CE 767 MR",
        "Nombre de place":"15",
        "avatar": "bus2"
      }
    ];

    return Scaffold(
      drawer: Navbar(),
      body: Stack( // Utilisation de Stack pour superposer les widgets
        children: [
          Column(
            children: [
              Stack(
                children: [
                  // Image d'arrière-plan
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/bg.jpeg', // Chemin de votre image d'arrière-plan
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Image au premier plan
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png', // Chemin de votre image au premier plan
                      width: 200, // Ajustez la largeur selon vos besoins
                      height: 300, // Ajustez la hauteur selon vos besoins
                    ),
                  ),
                  // AppBar personnalisée
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AppBar(
                      backgroundColor: Colors.transparent, // Fond semi-transparent
                      elevation: 0,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.notifications),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NotificationPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Text(
                  "Où allons nous aujourd'hui ?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0XFF3D56F0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Barre de recherche et bouton de tri
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFEEEEF0), // Couleur de fond modifiée
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Color(0xFFCDCDCD)), // Couleur du texte d'indice
                            prefixIcon: Icon(Icons.search, color:  Color(0xFFCDCDCD)), // Icône de recherche
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        icon: Icon(Icons.sort, color: Colors.black), // Icône de tri
                        onPressed: () {
                          // Logique de tri ici
                          print("Trier les résultats");
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Affichage des cartes avec couleur blanche
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Naviguer vers une nouvelle page avec les détails
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventDetailsPage(event: events[index]),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.white, // Couleur de fond de la carte
                        child: ListTile(
                          leading: Image.asset(
                            'assets/images/${events[index]["avatar"]}.jpeg', // Chemin de l'avatar
                            width: 50,
                            height: 50,
                          ),
                          title: Text(events[index]["Destination"]!),
                          subtitle: Text(events[index]["Date"]!),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // ElevatedButton circulaire
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add), // Icône du bouton
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF3D56F0), // Couleur de fond
            ),
          ),
        ],
      ),
    );
  }
}