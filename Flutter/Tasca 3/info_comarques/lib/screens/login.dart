import 'package:flutter/material.dart';
import 'package:info_comarques/screens/provincies.dart';
import 'package:info_comarques/screens/provincies2.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.3,
              image: AssetImage("assets/images/bg.webp"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Flexible(
                child: Image.asset("assets/images/logo.png",
                    width: 200, height: 200),
              ),
              const SizedBox(height: 10),
              const Text("Les nostres comarques",
                  style: TextStyle(
                    fontFamily: 'Personal',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nom d'usuari",
                        prefixIcon: const Icon(Icons.person),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Per favor, introdueix el seu nom d\'usuari ';
                        }
                        return null;
                      },
                      autofocus: true,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Contrassenya",
                        prefixIcon: const Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Per favor, introdueix la seva contrassenya ';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProvinciesScreen2(),
                              ),
                            );
                          },
                          child: const Text("Login"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                final usernameController =
                                    TextEditingController();
                                final passwordController =
                                    TextEditingController();

                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Registre",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        TextFormField(
                                          controller: usernameController,
                                          decoration: const InputDecoration(
                                            hintText: "Nom d'usuari",
                                            prefixIcon: Icon(Icons.person),
                                          ),
                                        ),
                                        TextFormField(
                                          controller: passwordController,
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                            hintText: "Contrassenya",
                                            prefixIcon: Icon(Icons.lock),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Registrar"),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context, {
                                                  "username":
                                                      usernameController.text,
                                                  "password":
                                                      passwordController.text,
                                                });
                                              },
                                              child: const Text("Cancelar"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ).then((result) {
                              if (result != null) {}
                            });
                          },
                          child: const Text("Registre"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
