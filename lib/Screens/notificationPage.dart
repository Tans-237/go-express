import 'package:flutter/material.dart';
import 'package:go_express/Screens/notifications_view.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();

}

class _NotificationPageState extends State<NotificationPage> {

  final mails = [
    {
      "Destinateur":"Professional Fossil Fuel Resources Co.",
      "mail title":"Réponce à la demande d'excursion "
    },
    {
      "Destinateur":"Australian High-Technologies Inc.",
      "mail title":"Réponce à la demande d'excursion "
    },
    {
      "Destinateur":"Professional Media Corporation",
      "mail title":"Réponce à la demande d'excursion "
    },
    {
      "Destinateur":"Australian Data Co.",
      "mail title":"Réponce à la demande d'excursion "
    },
    {
      "Destinateur":"Australian Data Co.",
      "mail title":"Réponce à la demande d'excursion "
    },
    {
      "Destinateur":"Australian Data Co.",
      "mail title":"Réponce à la demande d'excursion "
    },
    {
      "Destinateur":"Australian Data Co.",
      "mail title":"Réponce à la demande d'excursion "
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xFF3D56F0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: Center(
                            child: Image.asset(
                              'assets/images/Notification.png',
                              width: 200,
                              height: 200,
                            )
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, top: 0),
                      child: Center(
                        child: Text(
                            "Notifications",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD1C4E9), width: 1),
                  borderRadius: BorderRadius.circular(30)
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){}, child: Text("Toute")),
                  TextButton(onPressed: (){}, child: Text("Archivées")),
                  TextButton(onPressed: (){}, child: Text("Importante"))
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mails.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsView(),
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
                      title: Text(mails[index]["Destinateur"]!),
                      subtitle: Text(mails[index]["mail title"]!),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
