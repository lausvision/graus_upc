
class Grau{
  String _nom, _objectius, _modalitat, _link, _foto, _localitzacio, _branca, _ambit;
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
    this._nota
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

}