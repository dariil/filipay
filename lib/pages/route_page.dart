import 'package:filipay/pages/mainpage.dart';
import 'package:flutter/material.dart';
import 'background.dart';

class SelectRoutePage extends StatefulWidget {
  const SelectRoutePage({super.key});

  @override
  State<SelectRoutePage> createState() => _SelectRoutePageState();
}

class _SelectRoutePageState extends State<SelectRoutePage> {
  List<Map<String, dynamic>> RouteList = [
  {'origin': 'Villarosa Subdivision', 'destination':"España"},
  {'origin': 'Sucat', 'destination':"Alabang"},
  {'origin': 'Origin', 'destination':"Destination"},
  {'origin': 'Origin', 'destination':"Destination"},
  {'origin': 'Origin', 'destination':"Destination"},
  {'origin': 'Origin', 'destination':"Destination"},
  {'origin': 'Origin', 'destination':"Destination"},
  {'origin': 'Origin', 'destination':"Destination"},
  {'origin': 'Origin', 'destination':"Destination"},
  {'origin': 'Origin', 'destination':"Destination"},
  {'origin': 'Origin', 'destination':"Destination"},
  {'origin': 'Origin', 'destination':"Destination"},
  {'origin': 'Origin', 'destination':"Destination"},
  {'origin': 'Origin', 'destination':"Destination"},
  {'origin': 'Origin', 'destination':"Destination"},
];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            
            child: Stack(
              children: <Widget>[
                Align(alignment: AlignmentDirectional.topStart,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    "Select Route",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 0.0),
                    child: ListView.builder(
                      itemCount: RouteList.length, // Number of items in the list
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainPage(routePageLoad: true, qrScanLoad: false),
                                  ),
                                );
                              },
                            child: Container(
                              height: 60,
                              child: Center(
                                child: Text(
                                  "${RouteList[index]['origin']} - ${RouteList[index]['destination']}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black, // Border color
                                  width: 2, 
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Background(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}