import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (_, child) => Portal(child: child!),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text('Get Text'),
              onPressed: () {
                print(key.currentState!.controller!.markupText);
              },
            ),
            Container(
              child: FlutterMentions(
                key: key,
                fetchDataOnSearchTextChanged: fetchData,
                suggestionPosition: SuggestionPosition.Bottom,
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(hintText: 'hello'),
                mentions: [
                  Mention(
                      trigger: '@',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                      matchAll: false,
                      suggestionBuilder: (data) {
                        return Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  data['photo'],
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                children: <Widget>[
                                  Text(data['full_name']),
                                  Text('@${data['display']}'),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                  Mention(
                    trigger: '#',
                    disableMarkup: true,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    data: [
                      {'id': 'reactjs', 'display': 'reactjs'},
                      {'id': 'javascript', 'display': 'javascript'},
                    ],
                    matchAll: true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchData(String text)async{
    await Future.delayed(Duration(seconds: 1));
    print("Hello");
    if(text.isNotEmpty){
      if(data1.any((element) => (element["display"] as String).toLowerCase().contains(text.toLowerCase())))
        return data1;
      else if(data2.any((element) => (element["display"] as String).toLowerCase().contains(text.toLowerCase())))
        return data2;
    }
    return [];
  }
}

List<Map<String, dynamic>> data1 = [
  {
    'id': '61as61fsa',
    'display': 'Hamza',
    'full_name': 'Fayeed Pawaskar',
    "style" : TextStyle(color: Colors.blue),
    'photo':
    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
  },
  {
    'id': '61asasgasgsag6a',
    'display': 'Hamza',
    'full_name': 'DJ Khaled',
    "style" : TextStyle(color: Colors.blue),
    'photo':
    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
  },
];
List<Map<String, dynamic>> data2 = [
  {
    'id': '61as61fsa',
    'display': 'Mohammed',
    'full_name': 'Fayeed Pawaskar',
    "style" : TextStyle(color: Colors.blue),
    'photo':
    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
  },
  {
    'id': '61asasgasgsag6a',
    'display': 'Mohammed',
    'full_name': 'DJ Khaled',
    "style" : TextStyle(color: Colors.blue),
    'photo':
    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
  },
];
