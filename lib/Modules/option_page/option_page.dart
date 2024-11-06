import 'package:flutter/material.dart';

import '../Health_worker_detail/health_worker_detail.dart';
import '../donor_detail/donor_details.dart';

class option_page extends StatelessWidget {
  const option_page({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text('Please select the one applicable to you',style: TextStyle(
              fontSize: 18,

            ),),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>health_worker()));
                // Add login logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Health Worker',
                style: TextStyle(
                  fontSize: 16.0,

                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailForm()));
                // Add login logic here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.red,
                    width: 1
                  )
                ),
              ),
              child: const Text(
                'Donor',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
