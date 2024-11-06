import 'package:flutter/material.dart';

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  String selectedTimePeriod = "AM";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        timeController.text = pickedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC62C2C),
      appBar: AppBar(
        backgroundColor: Color(0xFFC62C2C),
        elevation: 0,
        title: const Text('Donate', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectTime(context),
                      child: AbsorbPointer(
                        child: TextField(
                          controller: timeController,
                          decoration: InputDecoration(
                            labelText: 'Time',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ToggleButtons(
                    isSelected: [selectedTimePeriod == "AM", selectedTimePeriod == "PM"],
                    onPressed: (int index) {
                      setState(() {
                        selectedTimePeriod = index == 0 ? "AM" : "PM";
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Text('AM'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Text('PM'),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    selectedColor: Colors.white,
                    fillColor: Color(0xFFC62C2C),
                    color: Colors.black,
                    borderColor: Colors.grey.shade300,
                    selectedBorderColor: Color(0xFFC62C2C),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Time Needed',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC62C2C),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle donation logic
                  Navigator.pop(context);
                },
                child: const Text(
                  'Donate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
