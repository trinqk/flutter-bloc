
# flutter-bloc  
BLoC implementation in Flutter. The project will be explained in full down below in the [BLoC in Flutter](#bloc-in-flutter) section. You can also look through the source for comments for more details. I recommend that after reading this, you fiddle with the BLoC yourself.  
  
Please note that there many ways to implement BLoC in Flutter and this project shows just one of many ways that it can be done.   
  
## Table of Content  
- [Getting Started](#getting-started)  
- [What is BLoC?](#what-is-bloc)  
- [BLoC in Flutter](#bloc-in-flutter)  
  - [Streams](#streams)  
  - [BLoC Provider](#bloc-provider)  
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
  
**BLoC**, which is short for **B**usiness **Lo**gic **C**omponents, is a design pattern introduced by Google regarding the seperation of UI and Business Logic.  
  
> BLoC is like a refactoring guideline to increase code share coverage when developing applications for multiple environments.
> 
> [Suguru Inatomi](https://medium.com/lacolaco-blog/bloc-design-pattern-with-angular-1c2f0339f6a3)

It was introduced during the DartConference 2018 by Paolo Soares, a Google Employee. I recommend you watch [this video](https://www.youtube.com/watch?v=PLHln7wHgPE&t=7s) to hear the full explanation of how the BLoC pattern should be implemented. It's an awesome talk (in my opinion) and he explains why the BLoC pattern was created. 
## BLoC in Flutter

