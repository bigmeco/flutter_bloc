import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/animeBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    AnimeBloc _bloc = AnimeBloc();
    return BlocProvider<AnimeBloc>(
      create: (BuildContext context) => _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<AnimeBloc, TestState>(
          builder: (BuildContext context, state) {
            if (state is SuccessState) {
              return Text(
                state.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              );
            }
            return Container();
          },
        ),
        floatingActionButton: BlocBuilder<AnimeBloc, TestState>(
          builder: (BuildContext context, state) {
            return FloatingActionButton(
              onPressed: () {
                // _bloc.add(LoadEvent());
                context.read<AnimeBloc>().add(LoadEvent());
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          },
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.


    );
  }
}
