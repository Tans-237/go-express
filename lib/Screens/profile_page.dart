import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String email = '';
  String phoneNumber = '';
  File? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: Color(0xFF3D56F0),
              width: double.infinity,
              height: 250,
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15, top: 25),
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                            child: _imageFile == null ? Icon(Icons.person, size: 50) : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                      "Hey shelsy",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: TextButton.icon(
                        onPressed: (){},
                        label: Text(
                            'History',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black
                          ),
                        ),
                        icon: Icon(Icons.history),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: TextButton.icon(
                      onPressed: (){},
                      label: Text(
                        'Numéro payeur',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black
                        ),
                      ),
                      icon: Icon(Icons.account_balance_sharp),
                    ),
                  ),
                )
              ],
            ),
          Container(
            child: TextButton.icon(
              onPressed: (){},
              label: Text("Mes biellets / Reservation"),
              icon: Icon(Icons.airplane_ticket),
            ),
          ),
          ],
        ),
      ),
    );
  }
}