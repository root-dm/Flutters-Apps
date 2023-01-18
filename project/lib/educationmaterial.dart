import 'package:flutter/material.dart';

class EducationMaterial extends StatelessWidget {
  const EducationMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 107, 16, 182),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading: true,
          title: Text('Educational Material'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                Text("1. What is breast cancer?"),
                Padding(padding: EdgeInsets.all(5.0)),
                Text("Breast cancer is a disease, in which cells in the breast divide uncontrollably. Based on which part is affected, Breast cancer can be categorized into different types. There are three parts of the breast:"),
                Padding(padding: EdgeInsets.all(5.0)),
                Text("● Lobules: are glands that produce milk"),
                Text("● Ducts: are tubes that carry milk to the nipple"),
                Text("● Connective tissue: consists of fibrous and fatty tissue, and supports the structure of the breast"),
                Padding(padding: EdgeInsets.all(5.0)),
                Text("The majority of BCs derive from the ducts or lobules"),
                Padding(padding: EdgeInsets.all(5.0)),
                Text("2. Main side effect of anti-cancer drugs - cardiotoxicity"),
                Padding(padding: EdgeInsets.all(5.0)),
                Text("Although new emerging treatments for breast cancer in the last decade have increased the overall survival of breast cancer patients, the main unresolved matter remains the lifelong side effects. Among those adverse effects, cardiovascular complications have a high prevalence. Over recent years, it has been proven that patients who undergo cardiotoxic therapies have a greater risk of heart disease, especially if they have multiple comorbidities or a history of cardiovascular disease. According to the National Cancer Institute of United States, cardiotoxicity is defined as ‘’toxicity that affects the heart’’ and may be:"),
                Padding(padding: EdgeInsets.all(5.0)),
                Text("● acute, which occurs during or soon after anticancer treatment and is not permanent"),
                Text("● chronic, which can be divided into:"),
                Text("    1. type I (early onset): irreversible heart cell injury and most of the times caused by anthracyclines and other chemo-drugs"),
                Text("    2. type II (late onset): typically caused by biological-targeted antibodies like trastuzumab "),
                Text("● myocardial dysfunction and heart failure"),
                Padding(padding: EdgeInsets.all(5.0)),
                Text("In general, the cardiovascular side effects of cancer treatment can be categorized into:"),
                Padding(padding: EdgeInsets.all(5.0)),
                Text("● coronary artery disease (i.e., heart attack)"),
                Text("● valvular disease"),
                Text("● heart rhythm problems-arrhythmias"),
                Text("● hypertension"),
                Text("● thromboembolic events (i.e., blood clots)"),
                Text("● peripheral vascular disease and stroke"),
                Text("● pericardial disease."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}