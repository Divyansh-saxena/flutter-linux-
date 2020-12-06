Create an app that can run any linux command using API

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



var a = "";


class linux extends StatefulWidget {
  @override
  _linuxState createState() => _linuxState();
}


// ignore: camel_case_types
class _linuxState extends State<linux> {
 


  @override
  Widget build(BuildContext context) {
    allcom() async {
      print("Collecting Data...");
      var url = 'http://192.168.43.210/cgi-bin/allconinfo.py';
      var response = await http.post(url);
      print('${response.body}');
      setState(() {
        a = response.body;
      });
    }


    commandex() async {
      print("Running Command...");
      var url = 'http://192.168.43.210/cgi-bin/basiclinux.py?x=&y=';
      var response = await http.post(url);
      print('${response.body}');
      setState(() {
        a = response.body;
      });
    }
    var appbar = AppBar(
      leading: Icon(Icons.adb),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: null),
        IconButton(icon: Icon(Icons.beach_access), onPressed: null),
      ],
      title: Text("Linux"),
    );


    var bodycommand = Container(
      color: Colors.black,
      margin: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        Container(
          child: TextField(
            autocorrect: false,
            onChanged: (val) {
               x = val;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
              labelText: 'Enter Linux commands',
            ),
          ),
        ),
        Card(
          child: FlatButton(
              onPressed: () {
                commandex();
              },
              child: Text('Submit Command')),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Text('commamds like:'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                    '~ date'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                    '~ cal'),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: Column(children: <Widget>[
            FlatButton.icon(
                onPressed: allcon,
                icon: Icon(Icons.refresh),
                label: Text("Refresh")),
            FlatButton(
                onPressed: null, child: Text("**ALL RUNNED COMMANDS**")),
            Text(a)
          ]),
        )
      ]),
    );
    // var sidedrawer = Slidedrawer();
    return Scaffold(
    //    drawer: sidedrawer,
        appBar: appbar,
        body: bodycommand);
  
 }
}



