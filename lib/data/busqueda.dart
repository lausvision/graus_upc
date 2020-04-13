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
}
