import 'package:http/http.dart' as http;
import 'dart:convert';


class Peticions {
  Future<void> getComarques(String provincia) async {
    String url =
        'https://node-comarques-rest-server-production.up.railway.app/api/comarques/comarquesAmbImatge/$provincia';

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> bodyJSON = jsonDecode(utf8.decode(response.bodyBytes));
        List<String> comarques =
            bodyJSON.map((comarca) => comarca['nom'].toString()).toList();

        for (String comarca in comarques) {
          print("\x1B[34m$comarca\x1B[34m");
        }
      } else if (response.statusCode == 404) {
        print("\x1B[31mNo reconec la Província\x1B[0m");
      }
    } catch (error) {
      throw Exception('Error en la solicitud: $error');
    }
  }

  Future<void> getInfoComarca(String comarca) async {
    String url =
        'https://node-comarques-rest-server-production.up.railway.app/api/comarques/infoComarca/$comarca';

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> bodyJSON =
            jsonDecode(utf8.decode(response.bodyBytes));
        Comarca infoComarca = Comarca.fromJSON(bodyJSON);
        print(infoComarca);
      } else if (response.statusCode == 404) {
        print("\x1B[31mNo reconec la Comarca\x1B[0m");
      }
    } catch (error) {
      throw Exception('Error en la solicitud: $error');
    }
  }
}
