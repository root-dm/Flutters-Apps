import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import './userdata.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Widget stepscard(String type, String type2, String remaining, String value, String description,
      IconData icon, IconData icon2, Color col, String route, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed(route);
        },
        child: Card(
          //το wdiget Card
          color: col,
          elevation: 5.0, //η σκια που θελουμε να φαινεται
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ), //στρογγυλοποιηση γωνιών της κάρτας
          child: Container(
            width: 150,
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 5.0), //συμμετρικη αποσταση στον καθετο αξονα
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    Icon(
                      icon,
                      size: 25,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Text(
                      type, //δυναμικο κειμενο εικονας
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 1.0, left: 10.0),
                  child: Text(
                    remaining,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        icon2,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        type2,
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.white,
                        ),
                      ),
                  ],),
                )
              ],
            ),
          ),
        ),
        //  ),
      ),
    );
  }

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

    Widget myItems(IconData icon, String heading, Color color) {
      return Material(
        color: Colors.white,
        elevation: 14.0,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(24.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        heading,
                        style: TextStyle(color: color, fontSize: 15.0),
                      ),
                    ),
                    Material(
                      color: color,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(icon, color: Colors.white, size: 30.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }


    return MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.blue,
                            Colors.purple,
                          ],
                        )
                      ),
                      child: Column(
                        children: [
                          Padding(padding: const EdgeInsets.only(top: 15.0)),
                          Center(
                            child: Text(
                              'Quote of the day',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.only(top: 8.0)),
                          Center(
                            child: Text(
                              data,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.only(top: 15.0)),
                        ],
                      ),
                    ),
                  ),
                  //load walking steps and heart rate avg
                  Container(
                    width: 330,
                    child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 2,
                          child: myItems(Icons.collections_bookmark_rounded, "Educational\n   Material", Colors.purple),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: Container(
                            child: FutureBuilder(
                              future: DefaultAssetBundle.of(context)
                                  .loadString('data_repo/response_calories_steps.json'),
                              builder: ((context, snapshot) {
                                if (snapshot.data == null) {
                                  return Container(
                                    child: Center(
                                      child: Text("Loading..."),
                                    ),
                                  );
                                } else {
                                  var newData = jsonDecode(snapshot.data.toString());

                                  return ListView.builder(
                                    itemCount: newData == null ? 0 : newData.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: stepscard("Walk", 'Phone', "Remaining: "+(8000-newData['activities'][index]['steps']).toString(), newData['activities'][index]['steps'].toString(), "steps", Icons.heart_broken, Icons.phone_android, Colors.purple, '/cardpageheartbeat', context),
                                      );
                                    },
                                    scrollDirection: Axis.horizontal,
                                  );
                                }
                              }),
                            )
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child:
                              Container(
                                child: FutureBuilder(
                                  future: DefaultAssetBundle.of(context)
                                      .loadString('data_repo/heartrate.json'),
                                  builder: ((context, snapshot) {
                                    if (snapshot.data == null) {
                                      return Container(
                                        child: Center(
                                          child: Text("Loading..."),
                                        ),
                                      );
                                    } else {
                                      var newData = jsonDecode(snapshot.data.toString());
                                      var result = newData['activities-heart'];
                                      double average = 0.0;
                                      for (var i = 0; i < result.length; i++) {
                                        average = average + newData['activities-heart'][i]['heartRate'];
                                      }
                                      average=average/result.length;

                                      return ListView.builder(
                                        itemCount: newData == null ? 0 : newData.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: stepscard("HeartBeat", 'Watch', "Avg", average.toStringAsFixed(1), "bpm", Icons.heart_broken, Icons.watch, Colors.blueGrey, '/cardpageheartbeat', context),
                                          );
                                        },
                                        scrollDirection: Axis.horizontal,
                                      );
                                    }
                                  }),
                                )
                              ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: myItems(Icons.settings, "Demographics", Colors.blueAccent),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: myItems(Icons.add, "Add Event", Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 107, 16, 182),
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
                          child: const Icon(
                            Icons.directions_walk_rounded,
                            color: Colors.black,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 15, top: 50)),
                        const Text('Steps'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserData(widget.user)));
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: const Icon(
                            Icons.heart_broken,
                            color: Colors.black,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 15, top: 50)),
                        const Text('HeartBeat'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserData(widget.user)));
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: const Icon(
                            Icons.collections_bookmark_rounded,
                            color: Colors.black,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 15, top: 50)),
                        const Text('Educational Material'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserData(widget.user)));
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: const Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 15, top: 50)),
                        const Text('Demographics'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserData(widget.user)));
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 15, top: 50)),
                        const Text('Urine Track'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserData(widget.user)));
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Color.fromARGB(255, 107, 16, 182),
            )));
  }
}
