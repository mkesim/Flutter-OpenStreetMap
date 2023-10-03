import 'package:flutter/material.dart';
import 'package:nearby/maps_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('En Yakındaki Hizmetler'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Hakkında'),
                    content: Text('Created by Mehmet Kesimalioğlu'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Kapat'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          serviceButton(context, 'AVM', Icons.shopping_cart, 'avm', Colors.blue),
          serviceButton(context, 'Ambulans', Icons.local_hospital, 'hastane', Colors.red),
          serviceButton(context, 'İtfaiye', Icons.local_fire_department, 'itfaiye', Colors.orange),
          serviceButton(context, 'Polis', Icons.local_police, 'polis', Colors.green),
          serviceButton(context, 'Eczane', Icons.medical_services, 'eczane', Colors.purple),
          serviceButton(context, 'Veteriner', Icons.pets, 'veteriner', Colors.brown),
          serviceButton(context, 'Benzin İstasyonu', Icons.local_gas_station, 'benzin istasyonu', Colors.grey),
          serviceButton(context, 'Restorantlar', Icons.restaurant, 'restoran', Colors.yellow),
        ],
      ),
    );
  }

  Widget serviceButton(BuildContext context, String label, IconData icon, String query, Color color) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapsScreen(query)),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 50.0), // You can adjust the size of the icon here.
          Text(label),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // This gives the button rounded corners.
        ),
      ),
    );
  }
}