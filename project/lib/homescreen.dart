import 'package:flutter/material.dart';
import './userdata.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  final List user;
  const HomeScreen(this.user);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String url = "https://api.adviceslip.com/advice";
  String data = "Loading daily quote please wait...";
  var isLoading = true; //μεταβλητη που δειχνει αν φορτωνει τα δεδομενα

  void getJSONData() {
    http.get(
        // κανουμε encode το url σε περιπτωση που εχει κενα (εδω δεν ισχυει)
        Uri.parse(Uri.encodeFull(url)),
        // του λεμε να δεχεται μονο json
        headers: {"Accept": "application/json"}).then((response) {  //χρησιμοποιουμε το then οταν θελουμε να περιμενουμε να παρει τιμη το future 
      // το response ειναι ενα object που περιεχει στο body τα δεδομενα
      print(response);

      // αλλαζουμε το state του widget και ποιο συγκεκριμενα τα data που επηρεαζουν το listview
      setState(() {
        var dataConvertedToJSON = json.decode(response.body);
        data = dataConvertedToJSON['slip']['advice'];
        isLoading=false; //αλλαζουμε σε false την μεταβλητη που δειχνει τον loader
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJSONData();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
              children: [
                Text(data),
                //load data from local json file with futurebuilder
                SingleChildScrollView(
                  child: FutureBuilder(
                    future: DefaultAssetBundle
                      .of(context)
                      .loadString('data_repo/response_calories_steps.json'),
                    builder: (context, snapshot) {
                      var newData = json.decode(snapshot.data.toString());
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text("Date: " + newData[index]['date']),
                                Text("Steps: " + newData[index]['steps']),
                                Text("Calories: " + newData[index]['calories']),
                              ],
                            ),
                          );
                        },
                        itemCount: newData == null ? 0 : newData.length,
                      );
                    }
                  ),
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 117, 150, 187),
                    ),
                    child: Text(
                      'Menu',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 15, top: 50)),
                        const Text('Demographics'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserData(widget.user)));
                    },
                  )
                ],
              ),
            ),
            appBar: AppBar(
              title: Text(
                "SQFlite app",
                style: TextStyle(color: Colors.black),
              ),
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Color.fromARGB(255, 117, 150, 187),
            )));
  }
}
