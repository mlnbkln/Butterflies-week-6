import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
        body: ButterflyData(),
        appBar: AppBar(title: Text("Butterflies!"),
        ),)
  )
  );
}

class ButterflyData extends StatefulWidget{
  @override
  _ButterflyDataState createState() => _ButterflyDataState();
}

class _ButterflyDataState extends State<ButterflyData>{
  int selectedIndex = -1;

//List of Butterfly names
  final List<String> butterflyName = <String>["Капустница", "Червонец фиолетовый", "Крапивница", "Павлиний глаз"];

//List of Butterfly descriptions
  final List<String> butterflyDescription = <String>[
    "Дневная бабочка из семейства белянок (Pieridae). Видовой эпитет происходит от лат. Brassica — капуста, одно из кормовых растений гусениц.",
    "Дневная бабочка из семейства голубянок.",
    "Дневная бабочка из семейства Нимфалиды (Nymphalidae), вид рода Aglais.",
    "Дневная бабочка из семейства нимфалид (Nymphalidae). Латинское биноминальное название происходит от Īnachis — царя Инаха и его дочери Ио в древнегреческой мифологии."
  ];


//Main App:
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column( //Sets up the Primary column layout for this app - 1)title, 2)list tiles, 3)description
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(//This will be the scrollable List of butterflies
                height: 60,
                width: 400,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  itemCount: butterflyName.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) => VerticalDivider(),
                  itemBuilder: _createListView,
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),//This is the description box, must be a function that calls the relevant index
                child: Text(
                    selectedIndex==-1?"Выбери бабочку!": "${butterflyDescription[selectedIndex]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ]),
      ),);
  }

  //Gesture recognition as a separate function:
  Widget _createListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          color: index == selectedIndex ? Colors.teal: Colors.white,
          child: Text(butterflyName[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
      ),
    );
  }
}