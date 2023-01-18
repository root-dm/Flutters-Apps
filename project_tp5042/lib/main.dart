// ignore_for_file: prefer_is_not_empty, use_build_context_synchronously, prefer_const_constructors
import 'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:database/helpers/db_helpers.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
List<String> genders = ['male', 'female', 'do not want to declare'];

void main() {
  runApp(
    const MaterialApp(
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  TextEditingController usernamehandler = TextEditingController();
  TextEditingController passwordhandler = TextEditingController();
  final globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                  width: 320,
                  child: Form(
                    key: globalkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Sign in",
                          ),
                        ),
                        Text(
                          "Sign in",
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          controller: usernamehandler,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        Text(
                          "Password",
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          controller: passwordhandler,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        Center(
                          child: Container(
                            width: 200,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 231, 37, 37)),
                              ),
                              onPressed: () async {
                                if (globalkey.currentState!.validate()) {
                                  final  returned = await DBHelper.loginfunc(usernamehandler.text, passwordhandler.text);
                                  if (!returned.isEmpty) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomeScreen(returned)),
                                    );
                                  }
                                }
                              },
                              child: Center(child: Text('Sign in')),
                            ),
                          ),
                        ),
                        Center(child: Text("Don't have an account? ")),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: Center(
                            child: Text(
                              "Sign up",
                              
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "Create an account, it's free",
                ),
              ),
              SizedBox(height: 30),
              FormSignup()
            ],
          ),
        ),
      ),
    );
  }
}

class FormSignup extends StatefulWidget {
  const FormSignup({Key? key}) : super(key: key);

  @override
  FormSignupState createState() {
    return FormSignupState();
  }
}

class FormSignupState extends State<FormSignup> {
  final globalkey = GlobalKey<FormState>();

  TextEditingController namehandler = TextEditingController();
  TextEditingController surnamehandler = TextEditingController();
  TextEditingController birthdatehandler = TextEditingController();
  String genderhandler = genders.first;
  TextEditingController weighthandler = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordhandler = TextEditingController();
  TextEditingController emailhandler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: namehandler,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Text(
            "Surname",
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: surnamehandler,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Text(
            "Birthdate",
          ),
          TextField(
            controller: birthdatehandler,
            decoration: InputDecoration(
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
                  birthdatehandler.text = formattedDate;
                });
              }
            },
          ),
          Text(
            "Gender",
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            value: genderhandler,
            onChanged: (String? newValue) {
              setState(() {
                genderhandler = newValue!;
              });
            },
            items: genders.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Text(
            "Weight",
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: weighthandler,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  num.tryParse(value) == null) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Text(
            "Username",
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: usernamecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Text(
            "Password",
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: passwordhandler,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 8) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Text(
            "Email",
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: emailhandler,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !value.contains('.') ||
                  !value.contains('@')) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Center(
            child: Container(
              width: 250,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 231, 37, 37)),
                ),
                onPressed: () {
                  if (globalkey.currentState!.validate()) {
                    DBHelper.insert('ask3db', {
                      'name': namehandler.text,
                      'surname': surnamehandler.text,
                      'birthdate': birthdatehandler.text,
                      'gender': genderhandler,
                      'weight': weighthandler.text.toString(),
                      'username': usernamecontroller.text,
                      'password': passwordhandler.text,
                      'email': emailhandler.text
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  }
                },
                child: Center(child: const Text('Sign up')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final List mydata;
  // ignore: use_key_in_widget_constructors
  const HomeScreen(this.mydata);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget mycardr(String type, String type2, String remaining, String value, String description,
      IconData icon, IconData icon2, Color col, String route) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          if (route == "walk") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => walk1()),
            );
          } else if (route == "heartbeat") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => heart1()),
            );
          }
        },
        child: Card(
          color: col,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
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
      ),
    );
  }

  final String linkr = "https://api.adviceslip.com/advice";
  String rt = "";
  var loadr = true;

  void rr() {
    http.get(
        Uri.parse(Uri.encodeFull(linkr)),
        headers: {"Accept": "application/json"}).then((response) {
      setState(() {
        var dataJson = json.decode(response.body);
        rt = dataJson['slip']['advice'];
        loadr=false;
      });
    });
  }

  Widget myItems(IconData icon, String heading, Color color, String route) {
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

  @override
  void initState() {
    super.initState();
    rr();
  }

  @override
  Widget build(BuildContext context) {
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
                            Colors.green,
                            Colors.orange,
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
                              rt,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.only(top: 15.0)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 310,
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
                                MaterialPageRoute(builder: (context) => educ()),
                              );
                            },
                            child: myItems(Icons.collections_bookmark_rounded, "educ\n   Material", Colors.purple, "educ"),
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
                                  var newData = jsonDecode(snapshot.data.toString());
  
                                  return ListView.builder(
                                    itemCount: newData == null ? 0 : newData.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: mycardr("walk", "phone", "remaining: "+(8000-newData['activities'][index]['steps']).toString(), newData['activities'][index]['steps'].toString(), "steps", Icons.heart_broken_sharp, Icons.phone_android_rounded, Colors.green, 'walk'),
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
                                      var newData = jsonDecode(snapshot.data.toString());
                                      var result = newData['activities-heart'];
                                      double count = 0.0;
                                      for (var i = 0; i < result.length; i++) {
                                        count = count + newData['activities-heart'][i]['heartRate'];
                                      }

                                      return ListView.builder(
                                        itemCount: newData == null ? 0 : newData.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: mycardr("HeartBeat", 'Watch', "Avg", (count/result.length).toStringAsFixed(0), "bpm", Icons.heart_broken_sharp, Icons.watch_later, Colors.yellow, 'heartbeat'),
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
                                MaterialPageRoute(builder: (context) => UserData(widget.mydata)),
                              );
                            },
                            child: myItems(Icons.settings, "Demographics", Colors.blueGrey, "demographics"),
                          ),                          
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: myItems(Icons.add, "Add Event", Colors.blue, "addevent"),
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
                      color: Color.fromARGB(255, 16, 182, 30),
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
                              builder: (context) => walk1()));
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
                              builder: (context) => heart1()));
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
                        const Text('educ Material'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => educ()));
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
                              builder: (context) => UserData(widget.mydata)));
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
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Color.fromARGB(255, 16, 182, 30),
            )));
  }
}

class UserData extends StatefulWidget {
  final List mydata;
  const UserData(this.mydata);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  final globalkey = GlobalKey<FormState>();

  TextEditingController namehandler = TextEditingController();
  TextEditingController surnamehandler = TextEditingController();
  TextEditingController birthdatehandler = TextEditingController();
  String genderhandler = genders.first;
  TextEditingController weighthandler = TextEditingController();
  TextEditingController usernamehandler = TextEditingController();
  TextEditingController passwordhandler = TextEditingController();
  TextEditingController emailhandler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Data'),
          backgroundColor: Color.fromARGB(255, 16, 182, 30),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: 300,
                child: Form(
                  key: globalkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.mydata[0]['name'],
                          border: OutlineInputBorder(),
                        ),
                        controller: namehandler,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Text(
                        "Surname",
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.mydata[0]['surname'],
                          border: OutlineInputBorder(),
                        ),
                        controller: surnamehandler,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Text(
                        "Birthdate",
                      ),
                      TextField(
                        controller: birthdatehandler,
                        decoration: InputDecoration(
                          hintText: widget.mydata[0]['birthdate'],
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
                              birthdatehandler.text = formattedDate;
                            });
                          }
                        },
                      ),
                      Text(
                        "Gender",
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: genderhandler,
                        onChanged: (String? newValue) {
                          setState(() {
                            genderhandler = newValue!;
                          });
                        },
                        items: genders
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Text(
                        "Weight",
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: widget.mydata[0]['weight'].toString(),
                          border: OutlineInputBorder(),
                        ),
                        controller: weighthandler,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              num.tryParse(value) == null) {
                            return 'Enter a valid number';
                          }
                          return null;
                        },
                      ),
                      Text(
                        "Username",
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.mydata[0]['username'],
                          border: OutlineInputBorder(),
                        ),
                        controller: usernamehandler,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Text(
                        "Password",
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        controller: passwordhandler,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Text(
                        "Email",
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.mydata[0]['email'],
                          border: OutlineInputBorder(),
                        ),
                        controller: emailhandler,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('.') ||
                              !value.contains('@')) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Center(
                        child: Container(
                          width: 250,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 16, 182, 30)),
                            ),
                            onPressed: () {
                              if (globalkey.currentState!.validate()) {
                                DBHelper.updatefun('ask3db', {
                                  'id': int.parse(
                                      widget.mydata[0]['id'].toString()),
                                  'name': namehandler.text,
                                  'surname': surnamehandler.text,
                                  'birthdate': birthdatehandler.text,
                                  'gender': genderhandler,
                                  'weight': weighthandler.text.toString(),
                                  'username': usernamehandler.text,
                                  'password': passwordhandler.text,
                                  'email': emailhandler.text
                                });
                              }
                            },
                            child: Center(child: const Text('Update db')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}


class educ extends StatelessWidget {
  const educ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 16, 182, 30),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('educ Material'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text("1. What is breast cancer?"),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


class heart1 extends StatefulWidget {
  const heart1({Key? key}) : super(key: key);
  @override
  _heart1State createState() => _heart1State();
}

class _heart1State extends State<heart1> {
  late List<ChartData> chartData;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ChartData> data = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 16, 182, 30),
        title: Text("Heartbeat"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('data/heartrate.json'),
        builder: (context, snapshot) {
          var newData = json.decode(snapshot.data.toString());
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              List my_objects = newData['activities-heart'];
              for (int i = 0; i < my_objects.length; i++) {
                data.add(ChartData(newData['activities-heart'][index]['dateTime'], newData['activities-heart'][index]['heartRate'],Colors.black));
index = index + 1;
              }

              return Container(
                height: 600,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(text: 'Heartbeats'),
                  legend: Legend(
                    isVisible: true,
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<ChartData, String>>[
                    LineSeries<ChartData, String>(
                      dataSource: data,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData heart, _) => heart._dateTime,
                      yValueMapper: (ChartData heart, _) => heart.rpm,
                      markerSettings:
                          MarkerSettings(isVisible: true, color: Colors.white),
                      color: Colors.black,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
              );
            },
            itemCount: newData == null ? 0 : 1,
          );
        },
      ),
    );
  }
}


class walk1 extends StatefulWidget {
  const walk1({Key? key}) : super(key: key);
  @override
  _walk1State createState() => _walk1State();
}

int steps = 0;
List chartData = [];

class _walk1State extends State<walk1> {
  late List<ChartData> chartData;
  late TooltipBehavior tooltipBehavior;
  
  @override
  void initState() {
    tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ChartData2> data = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 16, 182, 30),
        title: Text("Steps"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('data/response_calories_steps.json'),
        builder: (context, snapshot) {
          var newData = json.decode(snapshot.data.toString());
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              List my_objects = newData['activities'];
              for (int i = 0; i < my_objects.length; i++) {
                data.add(ChartData2(newData['activities'][index]['startTime'], newData['activities'][index]['steps'], Colors.black));
                index = index + 1;
              }
              return Container(
                height: 600,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(text: 'Steps'),
                  legend: Legend(
                    isVisible: true,
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<ChartData2, String>>[
                    LineSeries<ChartData2, String>(
                      dataSource: data,
                      pointColorMapper: (ChartData2 data, _) => data.color,
                      xValueMapper: (ChartData2 heart, _) => heart._dateTime,
                      yValueMapper: (ChartData2 heart, _) => heart.steps,
                      markerSettings:
                          MarkerSettings(isVisible: true, color: Colors.white),
                      color: Colors.black,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
              );
            },
            itemCount: newData == null ? 0 : 1,
          );
        },
      ),
    );
  }
}

class ChartData {
  final String _dateTime;
  final int rpm;
  final Color color;
  ChartData(this._dateTime, this.rpm, this.color);
}

class ChartData2 {
  final String _dateTime;
  final int steps;
  final Color color;
  ChartData2(this._dateTime, this.steps, this.color);
}
