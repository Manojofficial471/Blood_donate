import 'package:flutter/material.dart';

class RequestBloodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC62C2C),
      appBar: AppBar(
        backgroundColor: Color(0xFFC62C2C),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text('Request for Blood',
            style: TextStyle(color: Colors.white)),
        toolbarHeight: 80,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Genotype',
                    border: OutlineInputBorder(),
                  ),
                  icon: Icon(Icons.keyboard_arrow_down_rounded,size: 25,),
                  items: <String>['AA', 'AS', 'SS', 'AC'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(height: 35),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Blood Group',
                  border: OutlineInputBorder(),
                ),
                icon: Icon(Icons.keyboard_arrow_down_rounded,size: 25,),
                items: <String>[
                  'A+',
                  'A-',
                  'B+',
                  'B-',
                  'AB+',
                  'AB-',
                  'O+',
                  'O-'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 35),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Time Needed',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 35),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Institution Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC62C2C),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    showRequestSentDialog(context);
                  },
                  child: const Text(
                    'Request',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showRequestSentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/sucess.png', // Replace with the path to your image asset
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              'Request Sent',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    },
  );
}

