import 'package:flutter/material.dart';

import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/bloc/string_bloc.dart';
import 'package:flutter_bloc/bloc/string_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        bloc: StringBloc(),
        child: StringPage(),
      )
    );
  }
}
