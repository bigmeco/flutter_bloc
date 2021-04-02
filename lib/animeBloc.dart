import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AnimeBloc extends Bloc<TestEvent, TestState> {
  AnimeBloc() : super(InitState());

  @override
  Stream<TestState> mapEventToState(TestEvent event) async* {
    if (event is LoadEvent) {
      var response =
          await http.get(Uri.parse('https://animechan.vercel.app/api/random'));
      Map<String, dynamic> anime = jsonDecode(response.body);
      String _name = anime['anime'];
      String _quote = anime['quote'];

      log("fgdsf");
      yield SuccessState(_name, _quote);
    }
  }
}

abstract class TestEvent {

}

class LoadEvent extends TestEvent {}

abstract class TestState {}

class InitState extends TestState {}

class SuccessState extends TestState {
  String name;
  String quote;

  SuccessState(this.name, this.quote);
}
