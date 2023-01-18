import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph2 extends StatefulWidget {
  const Graph2({Key? key}) : super(key: key);
  @override
  _Graph2State createState() => _Graph2State();
}

int steps = 0;
List chartData = [];

class _Graph2State extends State<Graph2> {
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
        title: Text("Steps"),
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
                data.add(ChartData(newData['activities'][index]['startTime'], newData['activities'][index]['steps'], Colors.black));
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
                  series: <ChartSeries<ChartData, String>>[
                    LineSeries<ChartData, String>(
                      dataSource: data,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData heart, _) => heart._dateTime,
                      yValueMapper: (ChartData heart, _) => heart.steps,
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
  final int steps;
  final Color color;
  ChartData(this._dateTime, this.steps, this.color);
}
