import 'package:tasca2/peticions_http.dart';

Future<void> main(List<String> arguments) async {
  String? ordre;
  String? args;

  List<String> llistaArgs = List.from(arguments);

  ordre = llistaArgs[0];

  llistaArgs.removeAt(0);

  args = llistaArgs.join(" ");

  Peticions peticions = Peticions();

  if (ordre == "comarques") {
    peticions.getComarques(args);
  } else if (ordre == "infocomarca") {
    peticions.getInfoComarca(args);
  } else {
    print("\x1B[31mOrdre Desconeguda\x1B[0m");
  }
}
