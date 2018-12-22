import 'package:flutter/material.dart';

import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/bloc/string_bloc.dart';
import 'package:flutter_bloc/bloc/string_page.dart';

void main() => runApp(App());

/// [BlocProvider] - /bloc/bloc_provider.dart
/// Serves as a foundation for any custom [bloc]s we want to create
///
/// [StringBloc] - /bloc/string_bloc.dart
/// Sample [bloc]
///   - Example on how to use [BlocBase] to create a viable [bloc]
///
/// [StringPage] - /bloc/string_page.dart
/// Stateless Widget that uses [bloc] to display content

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC in Flutter',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        bloc: StringBloc(),
        child: StringPage(),
      )
    );
  }
}
