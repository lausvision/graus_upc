import 'package:cloud_firestore/cloud_firestore.dart';

class Grau{
  String _nom, _objectius, _modalitat, _link, _foto, _localitzacio, _branca, _ambit,_id;
  double _nota;

  Grau(
    this._nom,
    this._objectius,
    this._modalitat,
    this._link,
    this._foto,
    this._localitzacio,
    this._branca,
    this._ambit,
    this._nota,
    this._id
    );
 
  get nom => _nom;
  get objectius => _objectius;
  get modalitat => _modalitat;
  get link => _link;
  get foto => _foto;
  get localitzacio => _localitzacio;
  get branca => _branca;
  get ambit => _ambit;
  get nota => _nota;
  get id => _id;

}

class LlistaGraus{
  List<Grau> llistaGraus;

  LlistaGraus({this.llistaGraus});

}