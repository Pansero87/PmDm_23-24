import 'package:flutter/material.dart';
import 'package:info_comarques/data/peticions_http.dart';
import 'package:info_comarques/screens/comarques.dart';

class ProvinciesScreen2 extends StatefulWidget {
  const ProvinciesScreen2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProvinciesScreen2State createState() => _ProvinciesScreen2State();
}

class _ProvinciesScreen2State extends State<ProvinciesScreen2> {
  late String selectedProvincia;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: _buildBackgroundDecoration(),
      child: Center(
        child: _buildFutureBuilder(),
      ),
    );
  }

  BoxDecoration _buildBackgroundDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/bg.webp'),
        fit: BoxFit.cover,
        opacity: 0.3,
      ),
    );
  }

  FutureBuilder<List<dynamic>> _buildFutureBuilder() {
    return FutureBuilder<List<dynamic>>(
      future: _getProvincies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else if (snapshot.hasData) {
          return _buildProvinciesList(snapshot.data!);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildErrorWidget(Object? error) {
    return Text('Error: $error');
  }

  Widget _buildProvinciesList(List<dynamic> provincies) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: provincies.map((provincia) {
        return _buildProvinciaWidget(provincia);
      }).toList(),
    );
  }

  Widget _buildProvinciaWidget(dynamic provincia) {
    final String provinciaName = provincia['provincia'];
    final String imageUrl = provincia['img'];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedProvincia = provinciaName;
          });
          _navigateToComarquesScreen(provinciaName);
        },
        child: Column(
          children: [
            _buildCircleAvatar(provinciaName, imageUrl),
          ],
        ),
      ),
    );
  }

  void _navigateToComarquesScreen(String provinciaName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ComarquesScreen(provincia: provinciaName),
      ),
    );
  }

  CircleAvatar _buildCircleAvatar(String provinciaName, String imageUrl) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      radius: 90,
      child: Text(
        provinciaName,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Future<List<dynamic>> _getProvincies() async {
    final peticions = Peticions();
    return await peticions.getProvincies();
  }
}
