import 'package:flutter/material.dart';
import 'package:graus_upc/screens/InfoScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';

class Branca extends StatefulWidget {
  final String camp;
  Branca(this.camp);

  @override
  _BrancaState createState() => _BrancaState();
}

class _BrancaState extends State<Branca> {
  int _selectedIndex = 1;
  List<String> branca = [
    'Enginyeria i Arquitectura',
    'Ciències',
    'Ciències de la Salut',
    'Arts i Humanitats',
    'Ciències Socials i Jurídiques'
  ];

  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.camp);
    super.initState();
  }

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
                'Branca de coneixement',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              _camp(context, branca[0], true),
              _campfora(context, branca[1]),
              _campfora(context, branca[2]),
              _campfora(context, branca[3]),
              _campfora(context, branca[4]),
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
                    Navigator.of(context).pop(_controller.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _camp(BuildContext context, String valor, bool actiu) {
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
            if (actiu) 
              Icon(
               Icons.fiber_manual_record,
               color: Colors.blue[300],
              ),
          ],
        ),
      ),
      onTap: () {
        _campfora(context, widget.camp);
        print(widget.camp);
        _camp(context, valor, false);
      },
    );
  }

  Widget _campfora(BuildContext context, String valor) {
    return InkWell(
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  valor,
                  style: TextStyle(fontSize: 24, color: Colors.black54),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.fiber_manual_record,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black87,
            thickness: 1.5,
          ),
        ],
      ),
      
    );
  }
}
