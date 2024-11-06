import 'package:flutter/material.dart';

import '../../Widgets/custom_textfield.dart';
import '../doc_homepage/doc_homepage.dart';
class health_worker extends StatelessWidget {
  const health_worker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text('BloodDonate'
            ,style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
          ),
          SizedBox(height: 35,),
          CustomTextField(labelText: 'Title',),
          SizedBox(height: 20,),
          CustomTextField(labelText: 'Proffession',),
          SizedBox(height: 20,),
          CustomTextField(labelText: 'Location',),
          SizedBox(height: 20,),
          CustomTextField( labelText: 'Institution Name'),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DocHomePage()));
                // Add login logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

