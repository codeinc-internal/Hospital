import 'package:doctor/Responsive/responisve.dart';
import 'package:flutter/material.dart';

class Patient {
  final String name;
  final String address;
  final bool hasPaid;
  final String avatar;

  Patient(this.name, this.address, this.hasPaid, this.avatar);
}

class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  List<Patient> patients = [
    Patient('John Doe', '123 Street', true, 'https://via.placeholder.com/150'),
    Patient(
        'Jane Smith', '456 Avenue', false, 'https://via.placeholder.com/150'),
    Patient(
        'David Johnson', '789 Road', true, 'https://via.placeholder.com/150'),
    Patient(
        'Sarah Brown', '321 Lane', false, 'https://via.placeholder.com/150'),
  ];

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Expanded(
      child: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];

          return ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(patient.avatar),
            ),
            title: Text(
              patient.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.0),
                Text(
                  patient.address,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: patient.hasPaid ? Colors.green : Colors.red,
                      size: 12.0,
                    ),
                    SizedBox(width: 1.0),
                    Text(
                      patient.hasPaid ? 'Payment made' : 'Payment pending',
                      style: TextStyle(
                        fontSize: Responsive.isMobile(context) ? 12 : 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Delete Profile'),
                    content: Text(
                        'Are you sure you want to delete ${patient.name}\'s profile?'),
                    actions: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text('Delete'),
                        onPressed: () {
                          setState(() {
                            patients.removeAt(index);
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
