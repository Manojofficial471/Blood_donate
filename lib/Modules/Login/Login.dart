
import 'package:flutter/material.dart';

import '../option_page/option_page.dart';
import '../sign_up/signup.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 40.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'username',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
             print("Button Pressed");
                },
                child: const Text(
                  'forget password?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>option_page()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Log In',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));

                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}