import 'package:flutter/material.dart';


class CompatibilityChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC62C2C),

      appBar: AppBar(
        backgroundColor: Color(0xFFC62C2C),
        title: Text('Compatibility Chart',style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),nb
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Table(
              border: TableBorder.all(color: Colors.black),
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Blood Group',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Accept From',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Donate To',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                _buildTableRow('A+', 'A+ A- O+ O-', 'A+ AB+'),
                _buildTableRow('A-', 'A- O-', 'A+ A- AB+ AB-'),
                _buildTableRow('B+', 'AB- B+ B- AB+', 'B- O-'),
                _buildTableRow('B-', 'B- O-', 'AB- B+ B- AB+'),
              ],
            ),
          ),
        ),
      ),

    );
  }

  TableRow _buildTableRow(String bloodGroup, String acceptFrom, String donateTo) {
    return TableRow(
      children: [
        _buildTableCell(bloodGroup),
        _buildTableCell(acceptFrom),
        _buildTableCell(donateTo),
      ],
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}