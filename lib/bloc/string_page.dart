import 'package:flutter/material.dart';

import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/bloc/string_bloc.dart';

class StringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// Here we grab the [StringBloc] which is located at the top of our widget tree (main.dart)
    StringBloc _stringBloc = BlocProvider.of<StringBloc>(context);

    /// Listens to the [_stringBloc] using the outString[Stream], and display the data we receive with a [Text]
    Widget _blocOutput() {
      return StreamBuilder<String>(
        stream: _stringBloc.outString,
        initialData: "",
        builder: (context, snapshot) {
          return Text("${snapshot.data}", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),);
        },
      );
    }

    /// Update the [_stringBloc] using the onChange[Sink].
    /// This [TextField] will trigger a change anytime the value inside the [TextField] changes
    Widget _blocInput() {
      return TextField(
        onChanged: (value) => _stringBloc.onChange.add(value),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("BLoC"),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _blocOutput(),
            _blocInput(),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
