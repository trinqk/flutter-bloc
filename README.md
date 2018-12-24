
# flutter-bloc  
BLoC implementation in Flutter. The basics of the project will be explained in full down below in the [BLoC in Flutter](#bloc-in-flutter) section. You can also look through the source for comments for more details, which is what I recommend. I also recommend that after reading this, you fiddle with the BLoC yourself.  
  
Please note that there many ways to implement BLoC in Flutter and this project shows just one of many ways that it can be done.   
  
## Table of Content  
- [Getting Started](#getting-started)  
- [What is BLoC?](#what-is-bloc)  
- [BLoC in Flutter](#bloc-in-flutter)  
  - [Streams](#streams)  
  - [The BLoC](#the-bloc)  
- [Final Notes](#final-notes)
## Getting Started  
I am assuming you have Flutter already setup.  
For more information on how to setup Flutter, [click this link.](https://flutter.io/docs/get-started/install)  
#### 1. Clone the Repo  
```  
$ git clone https://github.com/trinqk/flutter-bloc.git  
$ cd flutter-bloc/  
```  
#### 2. Run the App  
```  
flutter run  
```  
## What is BLoC?  
So... What is **BLoC** anyways? What's this all about?  
  
**BLoC**, which is short for **B**usiness **Lo**gic **C**omponents, is a design pattern introduced by Google regarding the seperation of UI and [Business Logic](https://en.wikipedia.org/wiki/Business_logic). A simple explanation would be that the UI only displays information, having no knowledge of how the information was obtained while a seperate "component" handles the business logic and feeds information to the UI.

It was introduced during the DartConference 2018 by Paolo Soares, a Google Employee. I recommend you watch [this video](https://www.youtube.com/watch?v=PLHln7wHgPE&t=7s) to hear the full explanation of how the BLoC pattern should be implemented. It's an awesome talk and he explains why the BLoC pattern was created. 

## BLoC in Flutter

Poalo, the Googler who introduced the **BLoC** pattern, left us with a few guidelines to follow to properly incorperate it.

>### BLoC Design Guidelines
>1. Inputs and outputs are **simple Streams/Sinks only**
>2. Dependencies must be **injectable** and **platform agnostic**
>3. **No platform branching** allowed
>4. Implementation can be whatever you want if you follow the previous rules.

We'll be following these guidelines, so keep these in mind.

### Streams
The first BLoC design guideline mentions that inputs and outputs are simple streams/sinks only. Let's start by reviewing what streams/sinks are. I'll make it short and simple.

<div style="text-align:center"><img src =https://github.com/trinqk/flutter-bloc/blob/master/assets/streams.png?raw=true height="400"></div>

[Sinks](https://api.dartlang.org/stable/2.1.0/dart-core/Sink-class.html)  are like the top of a vertical pipe. We can send information down through the pipe, but we cannot view the information from the `Sink`, and no information can come back up to the `Sink`. The purpose of the `Sink` is to send information through the pipe.

[Streams](https://api.dartlang.org/stable/2.1.0/dart-async/Stream-class.html) are like the bottom of a vertical pipe. Information comes down from the top, but we cannot send information back up the pipe through the `Stream`. The purpose of the `Stream` is to observe the information coming out of the pipe. You can even process and control what comes out of a `Stream`, but we won't be going into detail on how to do that. (Maybe next time)

##### Note that when I say information, I mean any type of data . We can send objects, maps, and even other streams. 

---
A [StreamController](https://api.dartlang.org/stable/2.1.0/dart-async/StreamController-class.html) gives you a new stream and a way to add events to the stream at any point, and from anywhere. The stream has all the logic necessary to handle listeners and pausing. We can use a `StreamController` like so.

```dart
StreamController<String> _textController = StreamController<String>();

// Anything listening to the `outString` which is a `Stream` 
Stream<String> get outString => _textController.stream;

// will see any changes added to `_inString` which is a `Sink`. 
Sink<String> get _inString => _textController.sink;
```
Using a [StreamBuilder](https://docs.flutter.io/flutter/widgets/StreamBuilder-class.html), anytime we use `_inString`,  the UI will rebuild automatically. We can use `StreamBuilders` like so.
```dart
StreamBuilder<String>(
	stream: _stringBloc.outString,
	initialData: "",
	builder: (context, snapshot) {
		return Text(
			"${snapshot.data}", 
			style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold), 
			textAlign: TextAlign.center,
		);
	},
);
```
### The BLoC
Let's get started implementing the **BLoC**.

We'll use a `BlocBase` to determine what can be considered a `bloc` for our `BlocProvider`.
```dart
abstract class BlocBase {
	// Anything extending the [BlocBase] must implement the dispose method
	// Used to dispose the [StreamController]s that are used in [bloc]s
	void dispose();
}
```
What is a `BlocProvider`? 
We want our `bloc` to be available to the Widgets that need them. Some may be far down the Widget tree, and have no direct access to the actual `bloc`. The solution to this is the `BlocProvider`.  

```dart
class  BlocProvider<T  extends  BlocBase>  extends  StatefulWidget {
	
	BlocProvider({Key key, @required this.bloc, @required this.child,})
		: super(key: key);
	
	...
	
	/// Takes care of passing bloc reference throughout the tree
	/// 
	/// Children of the [BlocProvider] can use this method to get the reference 
	/// like so...
	///
	/// StringBloc _stringBloc = BlocProvider.of<StringBloc>(context);
	///
	static T of<T extends BlocBase>(BuildContext context){
		final type = _typeOf<BlocProvider<T>>();
		BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
		return provider.bloc;
	}
	
	static  Type _typeOf<T>() =>  T;
}
```
For more details , please check the [source](https://github.com/trinqk/flutter-bloc/blob/master/lib/bloc/bloc_provider.dart). 

---

Now we have to create a `bloc` using the `BlocBase`.
```dart
class  StringBloc  extends  BlocBase {
	/// REQUIRED METHOD
	@override
	void dispose() {}
}
```
Now we can add the `Streams/Sinks` that are needed for the inputs and outputs, and that's pretty much it!

Check out [`string_bloc.dart`](https://github.com/trinqk/flutter-bloc/blob/master/lib/bloc/string_bloc.dart) for more details.

---
### FINAL NOTES
Hopefully this helps you understand the **BLoC** pattern. If you have any questions at all regarding what I did or what you need to do, please check out the [source](https://github.com/trinqk/flutter-bloc/tree/master/lib), and read the comments. I tried to make this as short as I could and left out a lot of details. 

Also please understand that there are many ways to implement the **BLoC** pattern. Good luck!