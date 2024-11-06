import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart'; // If you're not using AwesomeBottomBar anymore, you can remove this import.

import '../blood_req/blood_req.dart';
import '../compatibilitychat/compatiblitychat.dart';
import '../contact_doner/donor_call.dart';
import '../donate/donate.dart';
import '../donor_list/donor_list.dart';

class DonorHomePage extends StatefulWidget {
  @override
  _DonorHomePageState createState() => _DonorHomePageState();
}

class _DonorHomePageState extends State<DonorHomePage> {
  int _currentIndex = 0; // State to keep track of the current index

  // List of screens for each bottom navigation item
  final List<Widget> _screens = [
    // Add your screens here based on the navigation
    // HomeScreen(), // Replace with your actual HomeScreen widget
    // AppointmentsScreen(), // Replace with your actual AppointmentsScreen widget
    // NotificationsScreen(), // Replace with your actual NotificationsScreen widget
    // ProfileScreen(), // Replace with your actual ProfileScreen widget
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Custom painted background with semi-circle.
            Positioned.fill(
              child: CustomPaint(
                painter: RedBackgroundPainter(),
              ),
            ),
            Column(
              children: [
                // Image or illustration section
                Container(
                  height: 350, // Adjust the height as needed
                  child: Center(
                    child: Image.asset(
                      'assets/donor_homepage1.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Text('Image not found');
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OptionButton(
                                icon: Icons.water_drop_outlined,
                                label: 'Donate',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DonatePage()),
                                  );
                                },
                              ),
                              OptionButton(
                                icon: Icons.send_sharp,
                                label: 'Request',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RequestBloodScreen()),
                                  );
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OptionButton(
                                icon: Icons.location_on_rounded,
                                label: 'Donation Centres',
                                onPressed: () {},
                              ),
                              OptionButton(
                                icon: Icons.zoom_in_map_outlined,
                                label: 'Blood \n Compatibility \n Chart',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CompatibilityChartPage()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarInspiredInside(
        items:  [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.calendar_today, title: 'Appointments'),
          TabItem(icon: Icons.notifications, title: 'Notifications'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        backgroundColor: Colors.red,
        elevation: 10,
        colorSelected: Colors.white,
        color: Colors.white, // Adjust color for unselected items
        indexSelected: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print('$index');// Update the current index
          });
        },
        chipStyle: const ChipStyle(convexBridge: true),
        itemStyle: ItemStyle.circle,
        animated: false,
        duration: Duration(seconds: 1),

      ),
    );
  }
}

// Custom Painter for the red semi-circle background.
class RedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red

      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(
      size.width / 2, size.height * 0.5,
      size.width, size.height * 0.3,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class OptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const OptionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 145,
        width: 135,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.redAccent,
            shadowColor: Colors.grey,
            elevation: 4,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.redAccent),
              SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
