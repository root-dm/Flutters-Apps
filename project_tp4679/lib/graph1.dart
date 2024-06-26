import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph1 extends StatefulWidget {
  const Graph1({Key? key}) : super(key: key);
  @override
  _Graph1State createState() => _Graph1State();
}

class _Graph1State extends State<Graph1> {
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
        backgroundColor: Color.fromARGB(255, 231, 140, 37),
        title: Text("Heartbeat"),
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

class ChartData {
  final String _dateTime;
  final int rpm;
  final Color color;
  ChartData(this._dateTime, this.rpm, this.color);
}
