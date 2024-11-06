import 'package:flutter/material.dart';

class DonorListScreen extends StatelessWidget {
  final List<Map<String, String>> donors = [
    {
      'name': 'Wunmi Tunde',
      'genotype': 'AS',
      'bloodGroup': 'AB-',
      'contact': '+234810983327',
      'address': 'Lorem ipsum dolor sit amet consectetur',
    },
    {
      'name': 'Adekunle Kareem',
      'genotype': 'AA',
      'bloodGroup': 'O+',
      'contact': '+234810983327',
      'address': 'Lorem ipsum dolor sit amet consectetur',
    },
    {
      'name': 'Mr. Tolu O.B.',
      'genotype': 'AA',
      'bloodGroup': 'O+',
      'contact': '+234810983327',
      'address': 'Lorem ipsum dolor sit amet consectetur',
    },
    {
      'name': 'William Dan',
      'genotype': 'AA',
      'bloodGroup': 'AB+',
      'contact': '+234810983327',
      'address': 'Lorem ipsum dolor sit amet consectetur',
    },
    {
      'name': 'Mrs Bimpe Zee',
      'genotype': 'AS',
      'bloodGroup': 'O-',
      'contact': '+234810983327',
      'address': 'Lorem ipsum dolor sit amet consectetur',
    },
    {
      'name': 'K. Marshal',
      'genotype': 'SC',
      'bloodGroup': 'A+',
      'contact': '+234810983327',
      'address': 'Lorem ipsum dolor sit amet consectetur',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC62C2C),
        elevation: 0,
        title: Text(
          'Donor\'s List',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
          Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Color(0xFFC62C2C),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50,bottom: 10),
              child: Text(
                'select from the list of donors to contact',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                ),
                child: ListView.builder(
                  itemCount: donors.length,
                  itemBuilder: (context, index) {
                    final donor = donors[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    donor['name']!,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Genotype',style: TextStyle(color: Colors.grey),),
                                      Text('${donor['genotype']}'),
                                    ],
                                  ), Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Blood Group',style: TextStyle(color: Colors.grey),),
                                      Text('${donor['bloodGroup']}'),
                                    ],
                                  ),Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Contact',style: TextStyle(color: Colors.grey),),
                                      Text('${donor['contact']}'),
                                    ],
                                  ),
                                  Icon(Icons.more_vert,size: 30,),


                                ],
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Address',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]
                                ),
                              ),
                              Text(
                                donor['address']!,

                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
