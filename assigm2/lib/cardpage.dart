import 'dart:convert';
import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

Widget customcard(String langname, String description, String imagepath,
    String route, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(2.0),
    child: InkWell(
      onTap: (() {
        Navigator.of(context).pushNamed(route);
      }),
      child: Card(
        elevation: 5.0,
        child: Wrap(
          children: [
            Image.asset(imagepath),
            ListTile(
              title: Text(langname),
              subtitle: Text(description),
            ),
          ],
        ),
      ),
    ),
  );
}

class CardPageSuggestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Suggestions'),
        ),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 400.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 330.0,
                  child: customcard(
                      'What is depression?',
                      'How often does a depressed person hear comments such as these?',
                      'assets/images/depression.jpg',
                      '/post1',
                      context),
                ),
                Container(
                  width: 330.0,
                  child: customcard(
                      'WHY IS THIS A PROBLEM??',
                      'The misunderstanding occurs because just about everyone has experienced sadness or “feeling down.”',
                      'assets/images/problem-solution-1024x775.jpg',
                      '/post2',
                      context),
                ),
                Container(
                  width: 330.0,
                  child: customcard(
                      'WHEN IS DEPRESSION CAUSED BY STRESS?',
                      'Although the above conditions appear to be biological conditions that are caused by genetic predispositions...',
                      'assets/images/stress-main.png',
                      '/post3',
                      context),
                ),
                Container(
                  width: 330.0,
                  child: customcard(
                      'WHY DOES IT SEEM THAT DEPRESSION IS CAUSED BY STRESS?',
                      'The fact is that the depressive disorders, as is true of most of the physical disorders, are reactive to stress...',
                      'assets/images/stressed-woman-at-work.jpg',
                      '/post4',
                      context),
                ),
              ],
            )));
  }
}

class CardPageQuestionaire extends StatefulWidget {
  const CardPageQuestionaire({Key? key}) : super(key: key);
  @override
  State<CardPageQuestionaire> createState() => _CardPageQuestionaireState();
}

class _CardPageQuestionaireState extends State<CardPageQuestionaire> {
  var questionIndex = 0;
  var questions = [];
  Future loadQuestions() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('data_repo/questionnaire.json');
    final jsonResponse = json.decode(jsonString);
    print(jsonResponse);
    setState(() {
      questions = jsonResponse;
      print(questions);
    });
  }

  answerQuestion() {
    setState(() {
      //χωρις το setState δεν θα γινει update το ui δηλαδη τα κουμπια και οι ερωτησεις
      questionIndex = questionIndex + 1;
    });

    print("answer pressed");
  }

  @override
  Widget build(BuildContext context) {
    loadQuestions();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Questionnaire")),
        body: questionIndex <
                questions
                    .length //Εαν ειναι μικροτερο απο το length εκτελεσε τον κωδικα μετα το "?""
            ? Column(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                    width: 300,
                    child: Center(
                      child: Text(
                        'Over the last 2 weeks, how often have you been bothered by any of the following problems?',
                      ),
                    ),
                  ),
                  Question(questions[questionIndex]['questionText']
                      as String), // με το as List<String> δηλωνουμε στο flutter οτι θα ειναι παντα λιστα το questions
                  ...(questions[questionIndex]['answers'] as List)
                      .map((answer) {
                    return Container(
                        width: 250, child: Answer(answerQuestion, answer));
                  })
                ],
              )
            : Center(
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Text("You did it"),
                    ElevatedButton(
                      child: Text("Homepage"),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/homepage');
                      },
                    )
                  ],
                ),
              ), //αν ειναι μεγαλυτερο απο το length εκτελει αυτο τον κωδικα μετα το ":"
      ),
    );
  }
}

class Post1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('What is depression?'),
        ),
        body: //load json data, and pass it to the widget
            SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
              "Some of these comments may be well-intentioned but they show a lack of understanding of the nature of depression. The problem is rooted in the use of the word “depression” as a diagnosis. The reason this is a problem is due to the word “depression” also being used by the public to describe a mood such as “I'm feeling depressed today.” However, a temporary mood and a diagnosable illness are two very different things. So the use of the same term to describe apples and oranges creates a great deal of confusion and misunderstanding. It certainly would make sense if we could change the name of the diagnosis to something else: “XYZ Disorder” that wouldn't have any other association in the public's mind. However, this was tried by the mental health profession in the past when they changed the diagnostic term manic-depression to bipolar disorder. At the same time they changed major depression to unipolar disorder but it wasn't accepted in either the public's mind or the profession's. Therefore, the best we can do at this point is to try and distinguish between the diagnosable conditions of depression and the common use of the word “depression.”"),
        ));
  }
}

class Post2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WHY IS THIS A PROBLEM?'),
        ),
        body: //load json data, and pass it to the widget
            SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
              "If the public calls this temporary mood state “depression” they will erroneously believe that they know what it feels like to be depressed in the clinical sense of the word. However, they will be wrong! Even though they are wrong, it won't stop them from making certain assumptions and comments that can be very detrimental to people who have a diagnosable condition. In particular, they are likely to have beliefs or even make comments such as “When I was depressed, I just snapped myself out of it” or “Depression is just a matter of attitude.” Certainly, these comments may relate to a temporary mood state, but they do not apply to the depressive disorders. Not only that, but saying these types of things to a depressed person can only serve to make them feel worse. However, these critical attitudes can make the depression worse. It is difficult enough for a person to manage the depression without having the additional stress of feeling like a failure."),
        ));
  }
}

class Post3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WHEN IS DEPRESSION CAUSED BY STRESS?'),
        ),
        body: //load json data, and pass it to the widget
            SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
              "Although the above conditions appear to be biological conditions that are caused by genetic predispositions, some people may experience temporary symptoms of depression due to stress. Such a condition is typically diagnosed as an adjustment disorder with depression or in the case of a traumatic experience may be diagnosed as an acute stress reaction. An adjustment disorder may involve the depressive symptoms but the symptoms can be traced to a single event or a period of stress in a person's life. In addition, an adjustment disorder is not likely to be recurrent unless triggered by other events or periods of stress. However, this condition should not be confused with a depressive illness which has an underlying biological cause as we understand it today. An adjustment disorder, in particular, can be very receptive to CBT methods since these methods directly impact the ability to cope with stress. In addition, practicing stress management methods and addressing daily stress is likely to be helpful in preventing the occurrence of an adjustment disorder."),
        ));
  }
}

class Post4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WHY DOES IT SEEM THAT DEPRESSION IS CAUSED BY STRESS?'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
              "The fact is that the depressive disorders, as is true of most of the physical disorders, are reactive to stress. This is due to the physiological impact of stress as well as the psychological impact. For instance, if a person has the common cold, their body will marshal the defenses such as producing white blood cells, adrenalin, and cortisol to fight the invading germs. When the body does this it requires additional energy and it reduces the functioning of other systems to obtain this energy. Therefore, a person will feel fatigued and will tend to be less active. The problem is that we only have so much in terms of physiological resources. In addition, the psychological impact of stress is that a person finds it more difficult to do the necessary self-care. With a common cold, for example, it may be hard to obtain the necessary rest. As a result of the physiological and psychological factors, it becomes more difficult to recover from the common cold. This same process occurs with clinical depression. The more stressors in a person's life, the more difficult it becomes to recover from the depression. Therefore, many people will tend to associate the presence of these stressors as the cause of the depression. However, that is not the case. The stressors may impact the depression and make it worse or more difficult to recover, but they are not typically the cause. In fact, if a stressor is the cause, it is likely a different condition known as an adjustment disorder rather than depression which we will discuss later. However, those sorts of suggestions and comments without a full understanding of clinical depression become detrimental rather than helpful because they can be seen as an attack which is just another stressor for the depressed individual"),
        ));
  }
}
