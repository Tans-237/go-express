import 'package:flutter/material.dart';
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
    return Scaffold(
      drawer: Navbar(),
      body: Column(
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
            margin: EdgeInsets.all(20),
              child: Text(
                  "Où allons nous aujourd'hui ? ",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0XFF3D56F0),
                  fontWeight: FontWeight.bold,
                ),
              )
          ),
          Card(
            child: ListTile(
              leading: Image.asset("assets/images/bus1.jpeg"),
              title: Text("Yaounde - Douala "),
              subtitle: Text("Départ 10h25"),
              //trailing: Icon(Icons.help),
            ),
          ),
        ],
      ),
    );
  }
}

