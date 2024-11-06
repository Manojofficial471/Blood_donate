import 'package:flutter/material.dart';

import '../doc_homepage/doc_homepage.dart';
import '../donor_homepage/donor_page.dart';

class DetailForm extends StatefulWidget {
  @override
  _DetailFormState createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  // Controllers for text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ailmentDetailsController = TextEditingController();

  // Dropdown values
  String? selectedBloodGroup;
  String? selectedGenotype;
  String? selectedGender;
  String? selectedAilment;

  final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  final List<String> genotypes = ['AA', 'AS', 'SS', 'AC'];
  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> ailments = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50), // Padding from the top

              Text(
                "Detail",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              Text(
                "Please enter your full detail",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 24),

              // Name Field
              buildTextField('Name', nameController),
SizedBox(height: 15),// Address Field
              buildTextField('Address', addressController),
              SizedBox(height: 15),
              // Blood Group Dropdown
              buildDropdown('Blood Group', selectedBloodGroup, bloodGroups, (newValue) {
                setState(() {
                  selectedBloodGroup = newValue;
                });
              }),
              SizedBox(height: 15),

              // Genotype Dropdown
              buildDropdown('Genotype', selectedGenotype, genotypes, (newValue) {
                setState(() {
                  selectedGenotype = newValue;
                });
              }),
              SizedBox(height: 15),
              // Date of Birth and Gender Fields (Side by side)
              Row(
                children: [
                  Expanded(child: buildTextField('Date of Birth', dobController)),
                  SizedBox(width: 16),
                  Expanded(
                    child: buildDropdown('Gender', selectedGender, genders, (newValue) {
                      setState(() {
                        selectedGender = newValue;
                      });
                    }),
                  ),
                ],
              ),
              SizedBox(height: 15),
              // Height and Weight Fields (Side by side)
              Row(
                children: [
                  Expanded(child: buildTextField('Height', heightController)),
                  SizedBox(width: 16),
                  Expanded(child: buildTextField('Weight', weightController)),
                ],
              ),
              SizedBox(height: 15),
              // Ailment Dropdown
              buildDropdown('Do you have any ailment?', selectedAilment, ailments, (newValue) {
                setState(() {
                  selectedAilment = newValue;
                });
              }),
              SizedBox(height: 15),
              // Ailment Details (Conditional)
              if (selectedAilment == 'Yes') buildTextField('If yes, please state', ailmentDetailsController),

              SizedBox(height: 40), // Spacing before button

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DonorHomePage()));
                    print('Form Submitted');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.red, // background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Enter',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for creating a text field
  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  // Widget for creating a dropdown field
  Widget buildDropdown(String label, String? selectedValue, List<String> options, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[700]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        value: selectedValue,
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),

    );
  }
}