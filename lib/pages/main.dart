import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../providers/belib_api_provider.dart';
import '../models/belib_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
const MyApp({Key? key}) : super(key: key);

@override
_MyAppState createState() => _MyAppState();
}

  class _MyAppState extends State<MyApp> {
  late Future<Belib> futureBelib;

  @override
  void initState() {
    super.initState();
    futureBelib = fetchBelib();
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
          )
        ),
        body: Center(
          child: FutureBuilder<Belib>(
            future: futureBelib,
            builder: (context, snapshot) {
              return RefreshIndicator(
              child: _listView(snapshot),
              onRefresh: _pullRefresh,
              );
            },
          ),
        ),
      ),
    );
  }
  Widget _listView(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
          itemCount: snapshot.data!.records.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(snapshot.data!.records[i].fields.idPdc),
              subtitle: Text("x: " + snapshot.data!.records[i].fields.coordonneesxy[0].toString() + " y: " + snapshot.data!.records[i].fields.coordonneesxy[1].toString()),
            );
          });
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }
    return const CircularProgressIndicator();
  }

  Future<void> _pullRefresh() async {
    futureBelib =  fetchBelib();
    Fluttertoast.showToast(
        msg: "Data update",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
    );
  }
}