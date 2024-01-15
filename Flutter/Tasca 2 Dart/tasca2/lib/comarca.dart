class Comarca {
  late String comarca;
  String? capital;
  String? poblacio;
  String? img;
  String? desc;
  double? latitud;
  double? longitud;

  Comarca(
      {required this.comarca,
      this.capital,
      this.poblacio,
      this.img,
      this.desc,
      this.latitud,
      this.longitud});

  Comarca.fromJSON(Map<String, dynamic> json) {
    comarca = json['comarca'] ?? '';
    capital = json['capital'];
    poblacio = json['poblacio'];
    img = json['img'];
    desc = json['descripcio'];
    latitud = json['latitud'];
    longitud = json['longitud'];
  }

  @override
  String toString() {
    return '''
nom:            $comarca
capital:        ${capital ?? 'No disponible'}
poblacio:       ${poblacio ?? 'No disponible'}
Imatge:         ${img ?? 'No disponible'}
descripció:     ${desc ?? 'No disponible'}
Coordenades:    (${latitud ?? 'No disponible'}, ${longitud ?? 'No disponible'})
''';
  }
}
