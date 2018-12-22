import 'dart:async';

import 'package:flutter_bloc/bloc-provider/bloc_provider.dart';

class StringBloc extends BlocBase {

  String _text;

  StreamController<String> _textController = StreamController<String>();
  Sink<String> get _inString => _textController.sink;
  Stream<String> get outString => _textController.stream;

  StreamController<String> _textChangeController = StreamController<String>();
  Sink<String> get onChange => _textChangeController.sink;

  StringBloc(){
    _text = "";
    _textChangeController.stream.listen(_onTextChange);
  }

  @override
  void dispose() {
    _textController.close();
    _textChangeController.close();
  }

  void _onTextChange(String text) {
    _text = text;
    _inString.add(_text);
  }

}