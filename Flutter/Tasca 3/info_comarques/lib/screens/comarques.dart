import 'package:flutter/material.dart';
import 'package:info_comarques/data/peticions_http.dart';
import 'package:info_comarques/screens/infocomarca.dart';

class ComarquesScreen extends StatelessWidget {
  final String provincia;

  const ComarquesScreen({super.key, required this.provincia});

  Future<List<dynamic>> _getComarques(String provincia) async {
    Peticions peticions = Peticions();
    return await peticions.getComarques(provincia);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comarques'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _getComarques(provincia),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> comarques = snapshot.data!;
            return Container(
              decoration: const BoxDecoration(),
              child: Center(
                child: ListView.builder(
                  itemCount: comarques.length,
                  itemBuilder: (context, index) {
                    var comarca = comarques[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoComarques(
                                comarca: comarca['comarca'],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(comarca['img']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ListTile(
                                  title: Text(
                                    comarca['comarca'],
                                    style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error en la solicitud'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
