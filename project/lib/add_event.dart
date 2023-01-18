import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'helpers/db_helpers.dart';

List<String> list = [
  'Urination',
  'Leak',
  'Urge',
  'Cough, Laugh, etc.',
];
List<String> intensity = [
  '1',
  '2',
  '3',
  '4',
  '5',
]; //e

class AddEvent extends StatefulWidget {
  // const AddEvent({Key? key}) : super(key: key);
  final List user;
  const AddEvent(this.user);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController dateController = TextEditingController();
  String eventController = list.first;
  String intensityController = intensity.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Event"),
        backgroundColor: Color.fromARGB(255, 107, 16, 182),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(padding: const EdgeInsets.all(10)),
          Container(
            width: 200,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 31, 80, 185)),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      title: Center(child: Text('Event Log')),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Event"),
                              DropdownButtonFormField(
                                value: eventController,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    eventController = newValue!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              //epomeno field
                              TextField(
                                decoration: InputDecoration( 
                                  icon: Icon(Icons.calendar_today), //icon of text field
                                  labelText: "Pick the date" //label text of field
                                ),
                                controller: dateController,
                                //Kwdikas apo https://www.fluttercampus.com/guide/39/how-to-show-date-picker-on-textfield-tap-and-get-formatted-date/
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2101));

                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd').format(pickedDate);
                                    setState(() {
                                      dateController.text = formattedDate;
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              //epomeno field
                              Text("Intensity"),
                              DropdownButtonFormField(
                                value: intensityController,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    intensityController = newValue!;
                                  });
                                },
                                items: intensity.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              Center(
                                child: Container(
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                                      backgroundColor: MaterialStateProperty.all<Color>(
                                       Color.fromARGB(255, 31, 80, 185)),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        DBHelper.insert('events', {
                                          'event': eventController,
                                          'date': dateController.text,
                                          'intersity': intensityController,
                                          'user_id': widget.user[0]['id'],
                                        });

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Processing Data')),
                                        );
                                      }
                                    },
                                    child: Center(child: const Text('Add Event')),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        // RaisedButton(
                        //     child: Text("Submit"),
                        //     onPressed: () {
                        //       // your code
                        //     })
                      ],
                    );
                });
              },
              child: Center(child: const Text('Add Event')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: FutureBuilder(
              future: DBHelper.getData('events'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print (snapshot.data);
                  return DataTable(
                    columns: [
                      DataColumn(label: Text('Event')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Intensity')),
                    ],
                    rows: snapshot.data
                        .map<DataRow>((event) => DataRow(cells: [
                              DataCell(Text(event['event'])),
                              DataCell(Text(event['date'])),
                              DataCell(Text(event['intersity'])),
                            ]))
                        .toList(),
                  ); 
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ]),
      ),
    );
  }
}