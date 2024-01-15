import 'package:flutter/material.dart';
import 'package:info_comarques/data/peticions_http.dart';
import 'package:info_comarques/screens/comarques.dart';

class ProvinciesScreen extends StatelessWidget {
  const ProvinciesScreen({super.key});

  Future<List<dynamic>> _getProvincies() async {
    Peticions peticions = Peticions();
    return await peticions.getProvincies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.webp'),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Center(
          child: FutureBuilder<List<dynamic>>(
            future: _getProvincies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<dynamic>? provincies = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: provincies!.map((provincia) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ComarquesScreen(
                                provincia: provincia['provincia'],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(provincia['img']),
                              radius: 90,
                              child: Text(
                                provincia['provincia'],
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
