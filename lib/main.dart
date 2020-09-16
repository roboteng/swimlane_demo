import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Page(),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Semantics(
                header: true,
                child: Text('Row and SingleChildScrollView'),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) => SwimLaneCard()),
                ),
              ),
              Semantics(
                header: true,
                child: Text('LisView'),
              ),
              SizedBox(
                height: 116,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.filled(10, SwimLaneCard()),
                ),
              ),
              Semantics(
                header: true,
                child: Text('ListView.builder'),
              ),
              SizedBox(
                height: 116,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) => SwimLaneCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SwimLaneCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Image.network(
            'https://i.insider.com/5582eaa3f7b1051e008b5997?width=1100&format=jpeg&auto=webp',
            semanticLabel: 'art',
          ),
        ),
      ),
    );
  }
}
