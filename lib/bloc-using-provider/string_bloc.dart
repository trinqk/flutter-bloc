import 'dart:async';

import 'package:flutter_bloc/bloc-using-provider/bloc_provider.dart';

/// ** SAMPLE BLOC **
/// This is just an example of how to use the [BlocBase] to create a viable [bloc]
///
/// [StringBloc] keeps track of a [String] and makes it available
/// to anything with access to the instance of [StringBloc]
class StringBloc extends BlocBase {

  /// _text will be the variable that is passed through the main [Sink]
  /// Anything observing the [Stream] will see the changes
  String _text;

  /// [_textController] is the main [StreamController]
  ///
  /// Any changes made by the _inString[Sink]
  /// will update anything listening to the outString[Stream]
  ///
  /// Note: _inString is private
  ///       outString is public (It needs to be observable)
  ///
  /// Note: The main job of [_textController] is give information on what content to display.
  /// It doesn't actually handle the changes made if you get what I mean.
  StreamController<String> _textController = StreamController<String>();
  Sink<String> get _inString => _textController.sink;
  Stream<String> get outString => _textController.stream;

  /// [_textChangeController] handles changes made to [_textController]
  ///
  /// Since the [_textController] only handles displaying the content, we need something to change the content.
  /// We can do this by introducing another [StreamController] and listening to changes made to it.
  /// This will be explained more below.
  StreamController<String> _textChangeController = StreamController<String>();
  Sink<String> get onChange => _textChangeController.sink;

  /// Here, we listen to the [_textChangeController]s [Stream]
  ///
  /// Any changes using the onChange[Sink] will call the _onTextChange method
  StringBloc(){
    _text = "";
    _textChangeController.stream.listen(_onTextChange);
  }

  /// REQUIRED METHOD
  /// Properly dispose of all [StreamController]s here
  @override
  void dispose() {
    _textController.close();
    _textChangeController.close();
  }

  /// When the _textChangeController.stream receives something through the onChange[Sink]...
  ///   - Change the _text of the instance into the value we received
  ///   - Use the _inString[Sink] to display the value received
  void _onTextChange(String text) {
    _text = text;
    _inString.add(_text);
  }

}