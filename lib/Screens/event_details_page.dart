import 'package:flutter/material.dart';

class EventDetailsPage extends StatefulWidget {
  final Map<String, dynamic> event;

  const EventDetailsPage({super.key, required this.event});

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  bool isPositive = true;
  final TextEditingController _controller = TextEditingController(text: '1');
  int? _total;
  int placeReserver = 1;
  @override
  void dispose() {
    _controller.dispose(); // Libérer le contrôleur
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Détails du voyage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8, bottom: 16, top: 16),
              child: Center(
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/${widget.event["avatar"]}.jpeg',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Agence:',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${widget.event["Agence"]}",
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Destination:',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              " ${widget.event["Destination"]}",
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Date:',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${widget.event["Date"].toString().substring(0, 10)}",
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Localisation:',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${widget.event["Localisation"]}",
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Immatriculation: ',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${widget.event["immatriculation"]}",
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Nombre de places disponible: ',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${widget.event["Nombre de place"]}",
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              "Price",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Color(0xFF3D56F0),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(child: Text('${widget.event["classe"]}', style: TextStyle(color: Colors.white),)),
                                SizedBox(width: 5),
                                Text('${widget.event["prix"]} FCFA', style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Combien de place souhaitez vous reserver?',
                            errorText: isPositive ? null : 'Veuillez entrer un nombre positif',
                          ),
                          onChanged: (value) {
                            setState(() {
                              isPositive = double.tryParse(value) != null && double.tryParse(value)! > 0;
                              placeReserver = int.tryParse(value)!;
                              _total = int.parse(widget.event["prix"]) * placeReserver;
                              print(value);
                            });
                          },
                        ),
                        Text("Total : ${_total} FCFA")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: isPositive ? () {
                      // Logique de réservation ici
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            textAlign: TextAlign.center,
                            'Payer avec',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Color(0xFFD1C4E9), width: 1),
                                ),
                                  child: Row(
                                    children: [
                                    Text('Réservation effectuée avec succès!'),
                                  ],
                              )),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } : null, // Désactive le bouton si isPositive est false
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF3D56F0),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Reserver"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}