import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'SliverAppBar';
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        home: MainPage(appTitle: appTitle),
      );
}

class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(appTitle),
              pinned: true,
            ),
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(appTitle),
                centerTitle: true,
                //collapseMode: CollapseMode.pin,
                background: Image.asset(
                  'images/background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            elements(),
          ],
        ),
      );

  Widget elements() {
    final Random random = Random();

    return SliverList(
      delegate: SliverChildListDelegate(
        List.generate(
          20,
          (index) => Container(
              height: 80.0,
              color: Color.fromRGBO(
                random.nextInt(255),
                random.nextInt(255),
                random.nextInt(255),
                1.0,
              )),
        ),
      ),
    );
  }
}
