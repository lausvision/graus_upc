import 'package:flutter/material.dart';
import 'package:graus_upc/screens/HomeScreen.dart';
import 'package:graus_upc/screens/InfoScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';
import 'package:provider/provider.dart';

class Modalitat extends StatefulWidget {
  @override
  _ModalitatState createState() => _ModalitatState();
}

class _ModalitatState extends State<Modalitat> {
  int _selectedIndex = 1;
  List<String> modalitat = ['Presencial', 'No presencial'];
  List<bool> actius = [true, false];

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InfoScreen(),
        ),
      );
    } else if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ),
      );
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtre = Provider.of<Filtrar>(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 13,
        unselectedLabelStyle: TextStyle(fontSize: 11, color: Colors.red),
        unselectedIconTheme: IconThemeData(size: 12, color: Colors.grey[600]),
        backgroundColor: Colors.white,
        iconSize: 24,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("CALENDAR"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text("HOME"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("PROFILE"),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "filtres",
          style: TextStyle(
            color: Colors.black38,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Modalitat',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              for (int i = 0; i < modalitat.length; i++)
                _camp(context, modalitat[i], actius, i, filtre),
              DecoratedBox(
                decoration: ShapeDecoration(
                    shape: StadiumBorder(), color: Colors.blue[200]),
                child: OutlineButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Afegeix',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  color: Colors.blue[200],
                  shape: StadiumBorder(),
                  onPressed: () {
                    //if (filtre.modalitat != null) {
                    Navigator.of(context).pop();
                    /* } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text('Selecciona un filtre per afegir.'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    }*/
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _camp(BuildContext context, String valor, List<bool> actius, int i,
      Filtrar filtre) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                valor,
                style: TextStyle(fontSize: 24, color: Colors.black54),
              ),
            ),
            if (filtre.modalitat != null)
              if (valor == filtre.modalitat)
                Icon(
                  Icons.fiber_manual_record,
                  color: Colors.blue[300],
                ),
          ],
        ),
      ),
      onTap: () {
        filtre.modificaMod(valor);
      },
    );
  }
}
