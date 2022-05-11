import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import '../models/comment_model.dart';
import '../providers/belib_api_provider.dart';
import '../providers/location_provider.dart';
import '../models/belib_model.dart';
import 'infos_markers.dart';
import 'details_markers.dart';
import 'add_comments.dart';
import 'package:belib/database/commentBox.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CommentBox.init();
  runApp(MaterialApp(
      home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Belib> futureBelib;
  late Future<Position> futureLocation;
  List<Marker> allMakersBelib = [];


  @override
  void initState() {
    super.initState();
    futureBelib = fetchBelib();
    futureLocation = determinePosition();
    //CommentBox.box.add(Comments(id:"test", title: "titre", message: "message"));
    //print(CommentBox.box.getAt(0).id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belib',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: RichText(
                text: const TextSpan(
                    text: 'BEL',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.yellow, letterSpacing: 2.0,),
                    children: <TextSpan>[
                      TextSpan(text: "IB'", style: TextStyle(color: Colors.green))
                    ]
                )
            ),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.sync),
                  tooltip: 'Update data',
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Data update",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                  }
              ),
              IconButton(
                  icon: const Icon(Icons.info_outline),
                  tooltip: 'Information',
                  onPressed: () => showInfosDialog(context)
              )
            ]),
        body: Center(
            child: loadMap()
        ),
      ),
    );
  }

  Widget _map(BuildContext context, AsyncSnapshot snapshot) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
            markers: allMakersBelib
        ),
      ],
    );
  }

  Widget loadMap() {
    return FutureBuilder<Belib>(
        future: futureBelib,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.records!.length; i++) {
              allMakersBelib.add(new Marker(
                  width: 45.0,
                  height: 45.0,
                  point: new LatLng(snapshot.data!.records![i].fields!.coordonneesxy![0], snapshot.data!.records![i].fields!.coordonneesxy![1]),
                  builder: (ctx) => new Container(
                    child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.red,
                        iconSize: 20,
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 300,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: Colors.white70.withOpacity(1)),
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size.fromHeight(50), // NEW
                                            ),
                                            child: const Icon(Icons.keyboard_arrow_down),
                                            onPressed: () => Navigator.pop(context),
                                          ),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                RichText(
                                                  text: TextSpan(
                                                      text: "Status of the Charge Point : ",
                                                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.green),
                                                      children: <TextSpan>[
                                                        TextSpan(text: snapshot.data!.records![i].fields!.statutPdc, style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
                                                      ]
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                      text: "District : ",
                                                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.amber),
                                                      children: <TextSpan>[
                                                        TextSpan(text: snapshot.data!.records![i].fields!.arrondissement, style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
                                                      ]
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                      text: "Operator name : ",
                                                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.green),
                                                      children: <TextSpan>[
                                                        TextSpan(text: snapshot.data!.records![i].fields!.nomOperateur, style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
                                                      ]
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                      text: "Max power kw : ",
                                                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.amber),
                                                      children: <TextSpan>[
                                                        TextSpan(text: snapshot.data!.records![i].fields!.puissanceNominale, style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
                                                      ]
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                      text: "Schedule : ",
                                                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.green),
                                                      children: <TextSpan>[
                                                        TextSpan(text: snapshot.data!.records![i].fields!.horaires, style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
                                                      ]
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                      text: "Update date : ",
                                                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.amber),
                                                      children: <TextSpan>[
                                                        TextSpan(text: snapshot.data!.records![i].fields!.dateMaj, style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
                                                      ]
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                TextButton.icon(
                                                    icon: Icon(Icons.feed_outlined),
                                                    label: Text("View details"),
                                                    onPressed: () => {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => DetailsMarker(snapshot.data!.records![i].fields!)),
                                                      )
                                                    }
                                                ),
                                                TextButton.icon(
                                                    icon: Icon(Icons.add),
                                                    label: Text("Add comment"),
                                                    onPressed: () => {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => AddComment(snapshot.data!.records![i].fields!.idPdcLocal.toString())),
                                                      )
                                                    }
                                                ),
                                              ],
                                            ),
                                          )
                                        ]
                                    ),
                                  ),
                                );
                              });
                        }
                    ),
                  )));
            }
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return FutureBuilder<Position>(
            future: futureLocation,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                allMakersBelib.add(new Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                  builder: (ctx) =>
                      Icon(
                        Icons.location_history,
                        color: Colors.blue,
                        size: 45,
                      ),
                ));
                return Container(
                  child: _map(context, snapshot),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          );
        });
  }
}