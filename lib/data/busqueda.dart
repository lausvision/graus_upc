//import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Busqueda {
  nombre(String campo) {
    return Firestore.instance
        .collection('Graus')
        .where('lletra', isEqualTo: campo.substring(0, 1).toUpperCase())
        .getDocuments();
  }

  tots() {
    return Firestore.instance.collection('Graus').getDocuments();
  }

  /*void _generanom() {}

  void _splitnom(String nom) {
    List<String> splitList = nom.split("");
    List<String> indexList = [];

    for (int i = 0; i < splitList.length; i++) {
      for (int y = 1; y < splitList[i].length + 1; y++) {
        indexList.add(splitList[i].substring(0, y).toLowerCase());
      }
    }
Firestore.instance.collection('Graus').where('nom',isEqualTo:nom).setData({'searchList':indexList});

  }*/
}
