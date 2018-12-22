import 'package:flutter/material.dart';

import 'package:flutter_bloc/bloc-provider/bloc_provider.dart';
import 'package:flutter_bloc/bloc-provider/string_bloc.dart';

class StringPage extends StatefulWidget {
  @override
  StringPageState createState() {
    return new StringPageState();
  }
}

class StringPageState extends State<StringPage> {

  StringBloc _stringBloc;

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _stringBloc = BlocProvider.of<StringBloc>(context);
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("BLoC using Provider"),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            StreamBuilder<String>(
              stream: _stringBloc.outString,
              initialData: "",
              builder: (context, snapshot) {
                return Text("${snapshot.data}", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),);
              },
            ),

            TextField(
              controller: _textEditingController,
              onChanged: (value) => _stringBloc.onChange.add(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
