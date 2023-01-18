import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import './education.dart';
import './login-register.dart';
import 'dart:convert';
import 'helpers/db_helpers.dart';
import './graph1.dart';
import './graph2.dart';

class HomeScreen extends StatefulWidget {
  final List user;
  const HomeScreen(this.user);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String link = "https://api.adviceslip.com/advice";
  String data = "";
  var loaded = true;
  void fetch() {
    http.get(
        Uri.parse(Uri.encodeFull(link)),
        headers: {"Accept": "application/json"}).then((response) {
      setState(() {
        var json2 = json.decode(response.body);
        var data2 = json2['slip'];
        data = data2['advice'];
        loaded=false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }
  Widget build(BuildContext context) {

    Widget card(String type, String type2, String remaining, String value, String description,
      IconData icon, IconData icon2, Color col, String route) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () {
          if (route == "graph2") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Graph2()),);
          } else if (route == "graph1") {
            Navigator.push(context,MaterialPageRoute(builder: (context) => Graph1()),);
          }
        },
        child: Card(
          color: col,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            width: 150,
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 5.0),
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
                      type,
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
                      margin: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 245, 77, 77),
                            Color.fromARGB(255, 209, 245, 77),
                          ],
                        )
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Quote of the day',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              data,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 2,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => education()),
                              );
                            },
                            child: myItems(Icons.window, "Educational\nMaterial", Colors.purple),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: Container(
                            child: FutureBuilder(
                              future: DefaultAssetBundle.of(context)
                                  .loadString('data/response_calories_steps.json'),
                              builder: ((context, snapshot) {
                                if (snapshot.data == null) {
                                  return Container(
                                    child: Center(
                                      child: Text(""),
                                    ),
                                  );
                                } else {
                                  var loadeddata = jsonDecode(snapshot.data.toString());
                                  return ListView.builder(
                                    itemCount: loadeddata == null ? 0 : loadeddata.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: card("Walk", 'Phone', "Remaining: "+(8000-loadeddata['activities'][index]['steps']).toString(), loadeddata['activities'][index]['steps'].toString(), "steps", Icons.monitor_heart_outlined, Icons.phone_android_outlined, Colors.red, 'graph2'),
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
                                      .loadString('data/heartrate.json'),
                                  builder: ((context, snapshot) {
                                    if (snapshot.data == null) {
                                      return Container(
                                        child: Center(
                                          child: Text(""),
                                        ),
                                      );
                                    } else {
                                      var loadeddata = jsonDecode(snapshot.data.toString());
                                      var result = loadeddata['activities-heart'];
                                      double num = 0.0;
                                      for (var i = 0; i < result.length; i++) {
                                        num = num + loadeddata['activities-heart'][i]['heartRate'];
                                      }
                                      return ListView.builder(
                                        itemCount: loadeddata == null ? 0 : loadeddata.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: card("HeartBeat", 'Watch', "Avg", (num/result.length).toStringAsFixed(0), "bpm", Icons.monitor_heart_outlined, Icons.watch_later, Colors.orange, 'graph1'),
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
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyUser(widget.user)),
                              );
                            },
                            child: myItems(Icons.settings, "Demographics", Colors.blueGrey),
                          ),                          
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: InkWell(
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => EducationMaterial()),
                            //   );
                            // },
                            child: myItems(Icons.add, "Add Event", Colors.blue),
                          ),
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
                      color: Color.fromARGB(255, 231, 140, 37),
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
                              builder: (context) => Graph2()));
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: const Icon(
                            Icons.monitor_heart_outlined,
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
                              builder: (context) => Graph1()));
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: const Icon(
                            Icons.window,
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
                              builder: (context) => education()));
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
                              builder: (context) => MyUser(widget.user)));
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
                    // onTap: () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => UrineTrack(widget.user)));
                    // },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Color.fromARGB(255, 231, 140, 37),
            )));
  }
}


List<String> dropdownvalues = ['Male', 'Female', 'Do not want to declare'];

class MyUser extends StatefulWidget {
  final List loggeddata;
  const MyUser(this.loggeddata);

  @override
  State<MyUser> createState() => _MyUserState();
}

class _MyUserState extends State<MyUser> {
  final _fKey = GlobalKey<FormState>();

  TextEditingController nController = TextEditingController();
  TextEditingController sController = TextEditingController();
  TextEditingController bController = TextEditingController();
  String gController = dropdownvalues.first;
  TextEditingController wController = TextEditingController();
  TextEditingController uController = TextEditingController();
  TextEditingController pController = TextEditingController();
  TextEditingController eController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Data'),
          backgroundColor: Color.fromARGB(255, 231, 140, 37),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Change any data you want",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                child: Form(
                  key: _fKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.loggeddata[0]['name'],
                          border: OutlineInputBorder(),
                        ),
                        controller: nController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Surname",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.loggeddata[0]['surname'],
                          border: OutlineInputBorder(),
                        ),
                        controller: sController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Birthdate",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextField(
                        controller: bController,
                        decoration: InputDecoration(
                          hintText: widget.loggeddata[0]['birthdate'],
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            setState(() {
                              bController.text = formattedDate;
                            });
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Gender",
                        style: TextStyle(fontSize: 15),
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: gController,
                        onChanged: (String? newValue) {
                          setState(() {
                            gController = newValue!;
                          });
                        },
                        items: dropdownvalues
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Weight",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: widget.loggeddata[0]['weight'].toString(),
                          border: OutlineInputBorder(),
                        ),
                        controller: wController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              num.tryParse(value) == null) {
                            return 'Enter a valid number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Username",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.loggeddata[0]['username'],
                          border: OutlineInputBorder(),
                        ),
                        controller: uController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Password",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "********",
                          border: OutlineInputBorder(),
                        ),
                        controller: pController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return 'Enter a valid password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Email",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.loggeddata[0]['email'],
                          border: OutlineInputBorder(),
                        ),
                        controller: eController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('.') ||
                              !value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: 250,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 160, 37, 231)),
                            ),
                            onPressed: () {
                              if (_fKey.currentState!.validate()) {
                                DBHelper.updater('demographics', {
                                  'id': int.parse(
                                      widget.loggeddata[0]['id'].toString()),
                                  'name': nController.text,
                                  'surname': sController.text,
                                  'birthdate': bController.text,
                                  'gender': gController,
                                  'weight': wController.text.toString(),
                                  'username': uController.text,
                                  'password': pController.text,
                                  'email': eController.text
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              }
                            },
                            child: Center(child: const Text('Update data')),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
