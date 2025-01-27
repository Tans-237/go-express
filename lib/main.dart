import 'package:date_field/date_field.dart';
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
    return  MaterialApp(
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final events = [
    {
      "Agence": "Touristique",
      "Destination": "Douala - Yaoundé",
      "Date": "2025-01-12T15:37:00",
      "classe": "Classique",
      "prix": "5000",
      "Localisation": "my location",
      "immatriculation": "CE 767 MR",
      "Nombre de place": "15",
      "avatar": "bus2"
    },
    {
      "Agence": "Finex",
      "Destination": "Yaounde - Mbalmayo",
      "Date": "2025-09-12T15:37:00",
      "classe": "VIP",
      "prix": "7000 ",
      "Localisation": "my location",
      "immatriculation": "CE 767 MR",
      "Nombre de place": "15",
      "avatar": "bus1"
    },
    {
      "Agence": "Galaxie",
      "Destination": "Mbalmayo - Yaoundé",
      "Date": "2024-01-23T15:00:00",
      "classe": "VIP",
      "prix": "1000",
      "Localisation": "my location",
      "immatriculation": "CE 767 MR",
      "Nombre de place": "15",
      "avatar": "bus3"
    },
    {
      "Agence": "United epress",
      "Destination": "Douala - Yaoundé",
      "Date": "2025-01-12T15:37:00",
      "classe": "VIP",
      "prix": "7000",
      "Localisation": "my location",
      "immatriculation": "CE 797 MR",
      "Nombre de place": "30",
      "avatar": "bus1"
    },
    {
      "Agence": "Touristique",
      "Destination": "Douala - Yaoundé",
      "Date": "2025-01-12T15:37:00",
      "classe": "Classique",
      "prix": "5000",
      "Localisation": "my location",
      "immatriculation": "CE 767 MR",
      "Nombre de place": "15",
      "avatar": "bus2"
    },
    {
      "Agence": "Regionale",
      "Destination": "Yaoundé - Mbalmayo",
      "Date": "2024-11-02T15:37:00",
      "classe": "Classique",
      "prix": "700",
      "Localisation": "my location",
      "immatriculation": "CE 667 MR",
      "Nombre de place": "19",
      "avatar": "bus3"
    },
    {
      "Agence": "Buca voyage",
      "Destination": "Douala - Yaoundé",
      "Date": "2025-01-12T15:37:00",
      "classe": "Classique",
      "prix": "5000",
      "Localisation": "my location",
      "immatriculation": "CE 767 MR",
      "Nombre de place": "15",
      "avatar": "bus2"
    },
    {
      "Agence": "Touristique",
      "Destination": "Douala - Yaoundé",
      "Date": "2025-01-12T15:37:00",
      "classe": "Classique",
      "prix": "5000",
      "Localisation": "my location",
      "immatriculation": "CE 767 MR",
      "Nombre de place": "15",
      "avatar": "bus2"
    },
    {
      "Agence": "Buca",
      "Destination": "Sangmelima - Yaoundé",
      "Date": "2025-01-12T12:30:00",
      "classe": "VIP",
      "prix": "5000",
      "Localisation": "my location",
      "immatriculation": "CE 767 MR",
      "Nombre de place": "15",
      "avatar": "bus2"
    }
  ];

  String searchQuery = "";
  String sortBy = 'Destination'; // Critère de tri
  bool ascending = true; // Ordre de tri
  late String travelClass = 'VIP';
  late String travelDestination = 'Yaoundé - Douala';
  late String chauffeur = 'Hamadou';
  late String vehicule = "LT 808 KP";

  @override
  Widget build(BuildContext context) {
    final filteredEvents = events.where((event) {
      return event["Destination"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          event["Agence"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          event["Date"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          event["classe"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          event["prix"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          event["Localisation"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          event["immatriculation"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          event["Nombre de place"]!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    // Tri des événements
    filteredEvents.sort((a, b) {
      int comparison = 0;

      switch (sortBy) {
        case 'Destination':
          comparison = a["Destination"]!.compareTo(b["Destination"]!);
          break;
        case 'Agence':
          comparison = a["Agence"]!.compareTo(b["Agence"]!);
          break;
        case 'Prix':
          try {
            comparison = int.parse(a["prix"]!.split(' ')[0]).compareTo(int.parse(b["prix"]!.split(' ')[0]));
          } catch (e) {
            comparison = 0; // Gérer l'exception en cas d'erreur de parsing
          }
          break;
        case 'Classe':
          comparison = a["classe"]!.compareTo(b["classe"]!);
          break;
        case 'Date':
          try {
            comparison = DateTime.parse(a["Date"]!).compareTo(DateTime.parse(b["Date"]!));
          } catch (e) {
            comparison = 0; // Gérer l'exception en cas d'erreur de parsing
          }
          break;
      }

      return ascending ? comparison : -comparison;
    });

    return Scaffold(
      drawer: Navbar(),
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/bg.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/logo_blanc.png',
                      width: 200,
                      height: 300,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AppBar(
                      backgroundColor: Colors.transparent,
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
              Stack(
                children: [Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFEEEEF0),
                              hintText: 'Search...',
                              hintStyle: TextStyle(color: Color(0xFFCDCDCD)),
                              prefixIcon: Icon(Icons.search, color: Color(0xFFCDCDCD)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          icon: Icon(Icons.sort, color: Colors.black),
                          onPressed: () {
                            _showSortDialog();
                          },
                        ),
                      ],
                    ),
                  ),
                )],
              ),
              Expanded(
                child: filteredEvents.isNotEmpty
                    ? ListView.builder(
                      itemCount: filteredEvents.length,
                      itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventDetailsPage(event: filteredEvents[index]),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0), // Coins arrondis
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              'assets/images/${filteredEvents[index]["avatar"]}.jpeg',
                              width: 50,
                              height: 50,
                            ),
                            title: Text(filteredEvents[index]["Destination"]!),
                            subtitle: Text(filteredEvents[index]["Date"]!),
                        ),
                      ),
                    );
                  },
                )
                    : Center(
                      child: Text(
                    "Aucun résultat pour " + searchQuery,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                //Navigator.push(context, PageRouteBuilder(pageBuilder:(_,__,___)=>AddTravelPage()));
                double heightbetween = 5;
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      textAlign: TextAlign.center,
                      'Add voyage',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Container(
                      width: double.infinity,
                      child: Form(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    textAlign: TextAlign.start,
                                      "Destination"
                                  ),
                                ],
                              ),
                              DropdownButtonFormField(
                                items: [
                                  DropdownMenuItem(value: 'Yaoundé - Mbalmayo', child: Text("Yaoundé - Mbalmayo")),
                                  DropdownMenuItem(value: 'Yaoundé - Douala', child: Text("Yaoundé - Douala"))
                                ],decoration: InputDecoration(
                                  border: OutlineInputBorder()
                              ),
                                value: travelDestination,
                                onChanged: (value) {
                                  setState(() {
                                    travelDestination = value!;
                                  });
                                },
                              ),
                              SizedBox(height: heightbetween),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      textAlign: TextAlign.start,
                                      "Classe"
                                  ),
                                ],
                              ),
                              DropdownButtonFormField(
                                items: [
                                  DropdownMenuItem(value: 'VIP', child: Text("VIP")),
                                  DropdownMenuItem(value: 'Classique', child: Text("Classique"))
                                ],decoration: InputDecoration(
                                border: OutlineInputBorder()
                              ),
                                value: travelClass,
                                onChanged: (value) {
                                  setState(() {
                                    travelClass = value!;
                                  });
                                },
                              ),
                              SizedBox(height: heightbetween),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      textAlign: TextAlign.start,
                                      "Chauffeur"
                                  ),
                                ],
                              ),
                              DropdownButtonFormField(
                                items: [
                                  DropdownMenuItem(value: 'Hamadou', child: Text("Hamadou")),
                                  DropdownMenuItem(value: 'Atangana', child: Text("Atangana"))
                                ],decoration: InputDecoration(
                                  border: OutlineInputBorder()
                              ),
                                value: chauffeur,
                                onChanged: (value) {
                                  setState(() {
                                    chauffeur = value!;
                                  });
                                },
                              ),
                              SizedBox(height: heightbetween),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      textAlign: TextAlign.start,
                                      "Immatriculation du véhicule"
                                  ),
                                ],
                              ),
                              DropdownButtonFormField(
                                items: [
                                  DropdownMenuItem(value: 'CE 737 PL', child: Text("CE 737 PL")),
                                  DropdownMenuItem(value: 'LT 808 KP', child: Text("LT 808 KP")),
                                  DropdownMenuItem(value: 'AD 808 KP', child: Text("AD 808 KP"))
                                ],decoration: InputDecoration(
                                  border: OutlineInputBorder()
                              ),
                                value: vehicule,
                                onChanged: (value) {
                                  setState(() {
                                    chauffeur = vehicule;
                                  });
                                },
                              ),
                              SizedBox(height: 2*heightbetween),
                              SingleChildScrollView(
                                child: DateTimeFormField(
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.black45),
                                    errorStyle: TextStyle(color: Colors.redAccent),
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.event_note),
                                    labelText: 'Date et heure de départ'
                                  ),
                                  mode: DateTimeFieldPickerMode.dateAndTime,
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (e) => (e?.day ?? 0) == 1? 'please not the first day ': null,
                                  //onChanged: (DateTime value){}
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Save'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Cancel'),
                      )
                    ],
                  ),
                );
              },
              child: const Icon(Icons.add),
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF3D56F0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSortDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String? selectedSortBy = sortBy;
        bool selectedAscending = ascending;

        return AlertDialog(
          title: Text('Trier par'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: selectedSortBy,
                isExpanded: true,
                items: [
                  DropdownMenuItem(value: 'Destination', child: Text('Destination')),
                  DropdownMenuItem(value: 'Agence', child: Text('Agence')),
                  DropdownMenuItem(value: 'Prix', child: Text('Prix')),
                  DropdownMenuItem(value: 'Classe', child: Text('Classe')),
                  DropdownMenuItem(value: 'Date', child: Text('Date')),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedSortBy = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ordre:'),
                  Switch(
                    value: selectedAscending,
                    onChanged: (value) {
                      selectedAscending = value; // Mise à jour instantanée sans setState
                      // Optionnel: Vous pouvez appeler setState ici si vous souhaitez mettre à jour l'affichage à l'extérieur du dialogue
                    },
                  ),
                  Text(selectedAscending ? 'Croissant' : 'Décroissant'),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  sortBy = selectedSortBy!;
                  ascending = selectedAscending;
                });
                Navigator.of(context).pop();
              },
              child: Text('Appliquer'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
          ],
        );
      },
    );
  }
}