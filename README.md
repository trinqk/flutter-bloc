
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
### BLoC Provider

###### ~Work in progress~
