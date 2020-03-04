import 'dart:io';
import 'dart:convert';

const dynamic fitxer = 'data.json';

class Grau {
  final String nom,
      branca,
      modalitat,
      localitzacio,
      objectius,
      ambit,
      link,
      foto,
      nota;

  Grau(this.nom, this.branca, this.modalitat, this.localitzacio, this.objectius,
      this.ambit, this.link, this.foto, this.nota);

  toString() =>
      '$nom/$branca/$modalitat/$localitzacio/$objectius/$ambit/$link/$foto/$nota';

  Grau.fromJson(Map<String, dynamic> jsonlist)
      : nom = jsonlist['nom'],
        branca = jsonlist['branca'],
        modalitat = jsonlist['modalitat'],
        localitzacio = jsonlist['localitzacio'],
        objectius = jsonlist['objectius'],
        ambit = jsonlist['ambit'],
        link = jsonlist['link'],
        foto = jsonlist['foto'],
        nota = jsonlist['nota'];

  Map<String, dynamic> toJson() => {
        'nom': nom,
        'branca': branca,
        'modalitat': modalitat,
        'localitzacio': localitzacio,
        'objectius': objectius,
        'ambit': ambit,
        'link': link,
        'foto': foto,
        'nota': nota
      };
}

//llegim la llista que tenim en un arxiu JSON
List<dynamic> llegirLlista() {
  var text = File(fitxer).readAsStringSync(); //el arxiu el passem a string

  var jsontext = jsonDecode(text); //llista de maps

  return jsontext; //tornem llista normal
}

//funcio que mostra per pantalla la llista
void mostraLlista(List<dynamic> llista) {
  for (int i = 0; i < llista.length; i++) {
    var info = Grau.fromJson(llista[i]);
    print("${i + 1}:");
    print("nom: ${info.nom}");
    print("branca: ${info.branca}");
    print("modalitat: ${info.modalitat}");
    print("localitzacio: ${info.localitzacio}");
    print("objectius: ${info.objectius}");
    print("ambit: ${info.ambit}");
    print("link: ${info.link}");
    print("foto: ${info.foto}");
    print("nota: ${info.nota}");

  }
}

///////////////////////////////////////////MAIN/////////////////////////////////////////////////////////
void main(List<dynamic> args) {
  // LEEMOS LISTA
  List<dynamic> llista = llegirLlista();

  mostraLlista(llista);
}
