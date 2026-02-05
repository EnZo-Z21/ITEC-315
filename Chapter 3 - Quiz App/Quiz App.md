# What Next?
- Now that we did an initial app we will dive into the next important set of topics
- This app will be a quiz app. 
- As a part of this we will have multiple screens and be able to navigate from one screen to another. Each screen will have a question and answers. 
- At the end we will get to a screen grading us and providing info on how we did
- We want it to be a little randomized as well

---
# Topics
- New Widgets and use
- New Features of some old widgets
- Conditional and list content
	- useful for all apps
- Overview of more complex interfaces

---
# Start a new project

- Command pallet (ctrl+shift+p) and new project
- Pick a folder 
- I called mine quiz_app
- Clear your lib folder (get rid of the main.dart)
- Grab the assets folder that is on canvas, add the assets/image into project

---

# Challenge
- Build this! 
- Write all the code to do this
- Button is not the type we used before, see if you can figure out what it is?
![[quiz_app_start.png | 200]]

---

# How to do it?
 1. Start
	 1. Clear Main
	 2. Initialize Git Project,
	 3. Stage Changes
	 4. Commit with message "Initial Quiz App"
 2. Create Main Method
 3. Create Runapp
 4. Import Material.dart
 5. Add MaterialApp to runapp
 6. Add a home argument with a scaffold
 7. Set a widget in the scaffold body
 8. Start making a custom widget, start_screen.dart
 9. Make it a class
 10. design the build method
 11. Return the widget
	 1. populate this based on previous
	 2. container w/ box gradient, center, col, images and sized boxes!
	 3. Button is an Outlined button (remember you can search documentation!)
		 1. [Material 2 Components widgets | Flutter](https://docs.flutter.dev/ui/widgets/material2)
 12. Make a constructor
 
---

# Answer
[[Solution 1]]

Main
```dart
import 'package:flutter/material.dart';
import 'package:quiz_app_test/start_screen.dart';

void main(){
  runApp(
     MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ]
            ),
          ),
          child: const StartScreen()
        ),
      ),
    ),
  );
}
```


---
# Continuing
- We now want the button to work so we can go to the next page
- First lets talk a little more about tweaking the button and image
	- Transparent image, button icon
- Icon can be done with the .icon constructor

```dart
 OutlinedButton.icon()
```
- This changes the variable parameters, and now we dont have child anymore
	- instead use label
- We also need an icon argument, this wants a widget (we can use any one)
	- Typically we want to use an icon widget
- This needs some parameters ( of course)
- Dart has some predefined ones we can use in the Icon class. 
	- We can add it in
```dart
OutlinedButton.icon(
            icon:Icon(),
```
- At this point we can cycle through to see which ones we like
- Pick whatever you like, im going to use
```dart
 icon:const Icon(Icons.arrow_right_alt),
```
- Child also now needs to be changed to label
```dart
OutlinedButton.icon(
            icon:const Icon(Icons.arrow_right_alt),
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text("Start Quiz"),
          )
```
---

# Let me be Transparent with you
- We will look at 2 options
- First is going to be shown, but not suggested. 
- We can refactor the image widget with adding a wrapper
	- right click, refactor, wrap with widget
	- name that as an Opacity widget and select an opacity
	- Values are between 0.0 (fully transparent) and 1.0 (fully visible)
```dart
Opacity(
            opacity: .5,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
            ),
          ),
```
- This is a useful widget, but it is performance intensive
	- Probably not a problem in a simple app like this, but could be problematic in a bigger app with a lot of stuff going on

---
# Alternative Approach
- For anything that we can set a color on we have an alternative
- Image has a color argument so lets look
- Lets try setting it to red first
```dart
Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Colors.red,
          ),
```
- We should already know the solution based on what we did previously!
- Again this is all just to tweak the screen to tailor it to our little hearts content

>! Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(150, 255, 255, 255)
          ),

---

# Back to changing the screen
- Now we want to work on getting from this screen to begin into a quiz questions screen
- This is going to happen in the on pressed call
	- We know we need to do a function
	- what should it do?
	- Replace the StartScreen with a new screen!
- So we need a new screen, and the way to replace the screen (remember that StartScreen is called in our main right now)

---

# On Pressed
- We need to use our on pressed function to do the behavior
- Remember, we want to make it go to a new screen
	- We want to replace start screen with a different widget
- We will need to learn how to render content conditionally
- And Also Lift State up
- First we will create a widget that will contain the material app
- Another new widget for the questions screen
- Make a quiz.dart and a questions_screen.dart
	- Both should be stateful

---
# Try it
- Build the Quiz.dart and questions_screen.dart
	- Make sure they are stateful
	- For the questions_screen.dart, just return a text widget
	- quiz should return the material app
	- 

---
# Conditional Rendering
- Right now our material app is really running which widget?
- Well we just need to replace that widget.
- Lets look in quizState
```dart
class _QuizState extends State<Quiz>{
	var activeScreen = StartScreen();
```
- Just need to store the widget in a variable!
- Now we need a way to change it

---
# Adding a Method
- Create a method called switch screen
	- This will change the current screen
```dart
  void switchScreen(){
    setState(() {
        activeScreen = QuestionsScreen();
      }
    );
  }
```
- Dont forget to also import!
- We still have a type mismatch problem
	- A type of questions screen cant be assigned to type start screen

---

# What is happening?
- var activeScreen is inferring its type from what we save into it
- We saved StartScreen so this makes it this type of value/object
- To fix this, just change the var keyword to widget
	- Now it will be the general widget type
```dart
Widget activeScreen = const StartScreen();
```
- Now we have code that changes the screenw hen the method is executed
- Need to change the value of the widget with the var
```dart
//child: const StartScreen(),
child: activeScreen,
```
- Again setstate rexecutes the build method and will update it
- This is not the only way to render content conditionally, but it is 1 way
- We still need to make switchScreen execute though, not connected to button yet
- We need to now lift the state up

---

# Lifting State up
- What does this mean?
![[lifting_state.png]]
- Problem is the button triggering the state change is in 1 widget, and the widget that should be affected by it is in another widget
- ![[state_lift.png]]

---
# Solution 
- We need to lift the state up
![[lift_up.png]]
- Solution is to manage state in quiz and put the function there, we have access to everything below
- We have effectively done this, but we need to lift the button up into here too
- Not enough to just manage the state in a parent widget, we also must make sure that the child gets access to the switch screen function

---
# More on Functions
- Functions just like objects and variable, are values
- How do i get outside values inside of a class constructor/method?
- Parameters!
```dart
//Modify our startScreen class
const StartScreen(void Function() startQuiz,{super.key});
//In Quiz
Widget activeScreen = const StartScreen(switchScreen);
```
- With this, our start screen can accept a function and have access to it
![[switch_state.png]]
---

# Cleaning it up
```dart
const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;
```
- Lets use the constructor techniques we did before, this will allow us to actually use the function
- Now we have the startQuiz var that can be used anywhere, liek in onPreseed. 
```dart
onPressed: () {
              startQuiz();
            },
//or more simply
onPressed:startQuiz,
```
- In general, our setup for state is pretty good, but we still have an error 

---

# Fixing the error
```dart
Widget activeScreen = const StartScreen(switchScreen);
//Shows an error 
```
- Right now the use and creation of the method are happening at the same time
- Doesnt know how to handle it
- That first line is just happening to early to reference the swithScreen method, doesnt exist yet
- We add an initState method
```dart
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
```
- this is provided by the state class
- We can override to add our own initialization logic
![[init_state.png]]

---

# InitState
 - We just need to start off the var, have initstate set it, and go from there
 ```dart
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    // TODO: implement initState
    super.initState();
  }
```
- Note that activeScreen was made nullable
	- It can start off empty

---

# Deep Dive: Flutter's (Stateful) Widget Lifecycle

Every Flutter Widget has a built-in **lifecycle**: A collection of methods that are **automatically executed** by Flutter (at certain points of time).

There are **three** extremely important (stateful) widget lifecycle methods you should be aware of:

- `initState()`: Executed by Flutter when the StatefulWidget's State object is **initialized**
    
- `build()`: Executed by Flutter when the Widget is built for the **first time** AND after `setState()` was called
    
- `dispose()`: Executed by Flutter right before the Widget will be **deleted** (e.g., because it was displayed conditionally)
    

You will encounter them all multiple times throughout the course - therefore you don't have to memorize them now and you will see them in action. It's still worth learning about them right now already.

---

# Alternative Method
- We can use Strings for the vars and utilize a ternary operator inside of the code
- Look at this alternative
```dart
class _QuizState extends State<Quiz>{
  var activeScreen = 'start-screen';

  void switchScreen(){
    setState(() {
        activeScreen ='questions-screen';
      }
    );
  }
  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: startAlignment,
            end: endAlignment,
          )),
          child: (activeScreen == 'start-screen') 
          ? StartScreen(switchScreen) 
          : const QuestionsScreen(),
        ),
      ),
    );
  }
}
```

---

# Another alt
```dart
class _QuizState extends State<Quiz>{
  var activeScreen = 'start-screen';

  void switchScreen(){
    setState(() {
        activeScreen ='questions-screen';
      }
    );
  }
  @override
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'questions-screen'){
      screenWidget = const QuestionsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: startAlignment,
            end: endAlignment,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}
```

---
# Using "if" Statements In Lists

In addition to what you learned in the previous lecture, in Dart, you may also use `if` inside of lists to conditionally add items to lists:

```dart
 final myList = [
	 1,
	 2,
	 if (today.equals("Monday"))
	     3
];
```
1.

In this example, the number `3` will only be added to `myList` if `condition` was met (`condition` can be `true` or `false` or a check that yields `true` or `false` - e.g., `day == 'Sunday'`).

Please note that there are **NO curly braces** around the `if` statement body. The `if` statement body also only comprises the next line of code (i.e., you can't have multiple lines of code inside the `if` statement).

You can also specify an `else` case - an alternative value that may be inserted into the list if `condition` is not met:

1. final myList = [
2.   1,
3.   2,
4.   if (condition)
5.     3
6.   else
7.     4
8. ];

Using this feature is optional. Alternatively, you could, for example, also work with a ternary expression:

1. final myList = [
2.   1,
3.   2,
4.   condition ? 3 : 4
5. ];

Especially when inserting more complex values (e.g., a widget with multiple parameters being set) into a more complex list (e.g., a list of widgets passed to a `Column()` or `Row()`), this feature can lead to more readable code.

---
# if Statements & Comparison Operators
When using `**if**` **statements** - no matter if inside or outside of functions - as well as when using **ternary expressions**, you ultimately must provide a boolean value (`true` / `false`):

1. if (true) {
2.   // do something ...
3. }
4. // or
5. true ? 'this' : 'that'

Of course, hardcoding `true` or `false` into the code makes no sense though - you wouldn't need an `if` statement or ternary expression if a value would always be `true` or always be `false`.

Instead, `true` or `false` is typically derived by comparing values - e.g, comparing a number to an expected value:

1. if (randomNumber == 5) {
2.   // do something
3. }

The `==` operator checks for **value equality** (i.e., the values on the left and right side of the operator must be equal). It **must not be mistaken** with the **assignment operator** (which uses a single equal sign: `=`).

The assignment operator is used to assign values to variables:

1. var userName = 'Max'; // assignment operator used
2. if (userName == 'Max') { ... } // comparison operator used

Besides the equality operator (`==`) Dart also supports many other key comparison operators:

- `!=` to check for **inequality** (`randomNumber != 5` expects `randomNumber` to NOT be `5`, i.e., to be any other value)
    
- `>` to check for the value on the left to be **greater than** the value on the right (`randomNumber > 5` yields `true` if `randomNumber` is greater than `5`)
    
- `>=` to check for the value on the left to be **greater than or equal to** the value on the right (`randomNumber >= 5` yields `true` if `randomNumber` is greater than `5` or equals `5`)
    
- `<` to check for the value on the left to be **smaller than** the value on the right (`randomNumber < 5` yields `true` if `randomNumber` is smaller than `5`)
    
- `<=` to check for the value on the left to be **smaller than or equal to** the value on the right (`randomNumber <= 5` yields `true` if `randomNumber` is smaller than `5` or equals `5`)

---

# Questions Screen
- Goal is this:
- ![[questions_screen.png]]
- We also need to let user click the options
- Store the results
- Also go to a new question every time we click
- Finally have a results screen

---

# Questions
- Define a class that will define the questions as objects
	- This way we can put the question together with the answer
	- Again we are grouping multiple data types together here
- Create a models folder in lib
- Make a quiz_question class there

---

# Create it
- Try creating this class
- Remember to make
	- Text variable for the question text
	- Answers variable
		- A list of all the answers
	- Constructor as well

---
# Make some Data
- After this we can make a place to save the data
- Create a data folder and a questions.dart file inside
```dart
import 'package:quiz_app/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    'How did Ed lose his Arm?',
    [
      'Putting his brothers soul in a suit of armor', //Make this the correct one for later. We will shuffle later
      'In a Duel',
      'In a Kitchen Accident', 
      'He has not lose his arm.'
    ]
  ),
```

---

# Make your own questions!
- We now need to output the questions on the questions screen 
- 1 After another
- Need to do this in the state
- Need the text, spacing, and 4 buttons for answers
```dart
Widget build(context)
  {
    return  Column(
      children: [
        const Text('The question...'),
        const SizedBox(height:30),
        ElevatedButton(
          onPressed: () {}, 
          child: const Text('Answer 1'),
        ),
        ElevatedButton(
          onPressed: () {}, 
          child: const Text('Answer 2'),
        ),
        ElevatedButton(
          onPressed: () {}, 
          child: const Text('Answer 3'),
        ),
        ElevatedButton(
          onPressed: () {}, 
          child: const Text('Answer 4'),
        ),
      ],
      );
  }  
```
- For now we just put dummy text, we will use code to populate soon
- Running, doesnt look great
	- need to adjust width and center
---
# Fixing
- Trying an alternative vs what we did on the main
- Right click the column
- Refactor, wrap with a sized box
```dart
 return  SizedBox(
      width: double.infinity,
```
- Double.infinity means take all width available
- Centering the Column vertically
```dart
child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
```

---

# More Styling
- For the question, its showing black and hard to read
- Lets set the style on it
	- We've done this before, easy
```dart
 const Text(
            'The question...',
            style:TextStyle(
              color: Colors.white,
            )
          ),
```

---
# Buttons
- We have repeated buttons
- We maybe dont want to copy the style 4 times on this, we want to be able to repeat the look and feel
- Solution?
	- Custom widget again
- We need to think about a few things.
	- What needs to come from outside when we construct this?
- Text for button, and function.
```dart
class AnswerButton extends StatelessWidget{
  const AnswerButton(
    {
      required this.answerText,
      required this.onTap, 
      super.key
    }
  );
   
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context){
    return 
    ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(),
      child: Text(answerText),
    );
  }
}
```

---

# Question Screen
- Now we can update the call in questions screen
```dart
AnswerButton(
            answerText: 'Answer 1',
            onTap: () {},
          ),
```
- Dont forget the import!
- also we need to do styling now
```dart
style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
      ),
```

- I just picked a blue color with white text
- We can also change the button style if we want to different shapes
```dart
style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        // shape:const BeveledRectangleBorder(

        // ),
      ),
```
- We can also give the buttons a little more space with padding
```dart
 ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical:10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        // shape:const BeveledRectangleBorder(

        // ),
      ),
```
---

# Adding Questions
- So now we want to add questions to the screen
- We have them in the questions.dart
- First, import it into the questions screen
- To use lists in dart, we treat them like arrays
- So where do we need this data?
	- Inside the Question state
	- So I will put it in the build method like this
```dart
@override
  Widget build(context)
  {
    final currentQuestion = questions[0];
```
- Now everything should fall into place for first question
- question text is now 
```dart
Text(
	currentQuestion.text,
	style:const TextStyle(
	  color: Colors.white,
	)
),
```
- We have a variable now so the text isnt const anymore
- Same for answers but with indexes
```dart
answerText: currentQuestion.answers[0]
```
- We have some code duplication, so we might want to change this a little though
- Also we can only put 4 answers right now (maybe questions have 3 or more than 4 buttons)
---

# Dynamically Generating Buttons
- We want to do this based on how many answers there are for a question
- Essentially we want to build 1 widget per string in the list
- We can do this with the **map** method
- Lists have a broad variety of methods that are callable
	- add to add items for example
- Map transforms values into other values
- Takes a function that will be executed 1 time for each list item
- Also passes the list item to the function
- Inside you return the transformed item
	- based on the item
	- Allows us to get something new based on the old one
- This is not chnging the original list, just returning a new one based on the original
```dart
currentQuestion.answers.map((item) {
  return AnswerButton(
	answerText: item, 
	onTap: (){});
}),
```

---

# Errors
- We now have a list of answer buttons
	- It cant treat this directly as a widget
	- its a list of them
	- Called an iterable
- Children can only take widgets, not lists
- We do this with the spread command
	- Takes a list and spreads it out into individual items
- Looks strange, watch out
```dart
...currentQuestion.answers.map((item) {
    return AnswerButton(
	answerText: item, 
	onTap: (){});
}),
```

---
# Spread
- Done with the ` ... ` command
- Again this pulls values out of a list, and inserts them in place as comma separated values in the code
![[Pasted image 20240229095905.png]]
- Can delete the answer buttons now

---

# Lets Style
- Lets make the buttons take up the full width so they are consistant
	- right now they are random sizes, looks unorgainzed
- Also want to shuffle them, dont want the first to show as correct every time
- Need to add the tap to get to the next/results

---

# Layout
- In the column we can set crossaxis alignment to stretch
```dart
child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
```
- Stretches the cross axis to be as wide as possible, lets look
- Now they are super big, lets tone that back a little with padding or margin (can use either)
![[Pasted image 20240229100328.png]]
- we will do margin
- Wrap the column widget in a container
	- this has a margin argument
```dart
child: Container(
	margin: const EdgeInsets.all(20),
child: Column(
```
- Now it looks pretty good, but we also want to center the text which got messed up
```dart
Text(
              currentQuestion.text,
              style:const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              ),
```
- TextAlign lets us center this
	- Its not in the style!

---

# Everyday I'm shufflin'
- How to do this?
- Shuffle method!
- This actually does change the original list though
	- We want to make sure in the original correct is in index 0 or we wont be able to grade it
- So we can make a copy of it
- So where to make a method to shuffle the answers and get them back as a copy?
	- Where do we put methods that modify behavior or a variable?
	- In the class where the variable is
- List has some functions built in
- List.of() creates a copy from another list
```dart
  List<String> getShuffledAnswers(){
    final shuffledList = List.of(answers); //copies list
    shuffledList.shuffle(); //shuffles it in place
    return shuffledList; //returns the values
  }
```
- We can call this back where we were getting the map
```dart
...currentQuestion.getShuffledAnswers().map((item) 
```

---

# Next Question
- To change this, on a click we need to change the index
- This will change the question
- We need to manage this as state
	- This is why its in a stateful widget
- I can make a var to handle this and use that
- Also need a method to handle behavior to go to next index
```dart
class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;

  void answerQuestion(){
    setState(() {
      currentQuestionIndex++;
    });
    
  }

  @override
  Widget build(context)
  {
    final currentQuestion = questions[currentQuestionIndex];

```
- and call that function in the button
```dart
const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((item) {
                return AnswerButton(
                  answerText: item, 
                  onTap: answerQuestion);
            }),  
```
- Note we are passing it the text answerQuestion with no parenthesis
	- This is because we are pointing to the function here that it should call
- Try it now!

---
# Touch Ups
- Quick touch up, lets center the button text
- In the answer_button dart
```dart
child: Text(
        answerText,
        textAlign: TextAlign.center,
        )
```
- I also want to adjust the question text to be bigger with a different font
- We can use outside libraries for this
	- google_fonts is one of these
- https://pub.dev/packages/google_fonts
- https://docs.flutter.dev/cookbook/design/fonts

---

# 3rd Party Packages
- Getting third party packages is an important part of doing apps in general
- The pub.dev is the official 3rd party host site for dart packages
- We will see a readme, changelog, examples, and install instructions
	- Install instructions are important for us now!
- Windows people
![[Pasted image 20240229104352.png]]
- Open your vs code terminal
	- View->Terminal
	- Or ctrl/cmd+`
- When you open this, it will open your terminal inside of the project folder
- PAste the install command here
- We should see this as a new dependency
- Where?

---
# Using it
- Go to quesitions_screen.dart
- Import the new code (need to tell the project about it)
```dart
import 'package:google_fonts/google_fonts.dart';
```
- Next we just need to use its style in the block
- replace the style we used for the question
- use the GoogleFonts. to look at them
	- Can review also at fonts.google.com
- I ended up with this but you can do anything you want
```dart
style:GoogleFonts.lato(
	color:Colors.white,
	fontSize: 24,
	fontWeight: FontWeight.bold,
),
```
- We can now do this everywhere if we want, just remember to import

---

# Passing Data
- Next Goal is to pass data from screen to screen
- We have it changing, but we need to keep track of where we are and what we answered
- Our logic for changing the screen is in answerQuestion
- We need to lift up our state though
	- Quiz.dart has access to the multiple screens
	- Has access to start and questions screen
	- Also needs to be the one responsible for the results screen
![[Pasted image 20240229105300.png]]

- In the quizState we can add a new variable
```dart
final List<String> selectedAnswers = [];
```
- We also need a way to add questions to this list
```dart
  void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);
  }
```
- We need to get this into the questions_screen so its called when we choose a question though
- We have to pass choose answer as a value to questions screen. 

---

# Passing the Function
```dart
void switchScreen(){
    setState(() {
        activeScreen =const QuestionsScreen(chooseAnswer);
      }
    );
  }
```
- We can add this as a parameter like before
- We need to then modify the class to receive this parameter
- This goes to the widget class
	- Not the state class
```dart
class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
```
- We name this onSelectAnswer to follow the naming convention for what should happen on a specific event that we are defining
	- Event is select answer, this is the function that will run when it sees this event happen
```dart
 void switchScreen(){
    setState(() {
        activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
      }
    );
  }
```
- Need one more touch up on this to get it working (name the parameter, take away the const)
- We are now forwarding the function from quiz to questions screen

---

# Widget Property
- Now that function is available in the questions screen widget class, but not the state
	- But we need it here to, how to get it here?
- We can use the widget property in the state class
- Give by flutter
- Gives access to the widget class and its properties inside of a state class

```dart
void answerQuestion(){
    resu.onSelectAnswer('...');
    setState(() {
      currentQuestionIndex++;
    });
    
  }
```
- So now we need to modify this so that it uses the on select answer to recieve the answer
- In order for us to do this, we need to once again get outside information into our function
	- So parameters to the rescue
```dart
void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    }); 
  }
```

---

# Passing values across multiple widget
![[Passing Values across multiple widgets.png]]
- So now we are passing the function from quiz to quiz question
- Forwarding that function to the state
- The state will receive data on its function call and pass it back to the widget function back out to the quiz classes function handling that. 
- Still need to update the class to actually get the string

---
# onTap
- onTap requires a function pointer and you cannot pass it a parameter
- So how do we get it to take one in our answerQuestion
- need to use an anonymous function
```dart
onTap: (){
	answerQuestion(item);
});
```

--- 

# Preventing the Crash
- Need to check how many questions were answered
- How do we know when we are done?
- One solution
	- When our answers list has as many entries as we have questions
- Make sure to import questions into quiz.dart
```dart
void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      //switch to the results screen
      //setting to start screen for now
      setState(() {
        activeScreen = StartScreen(switchScreen);
      });
    }
  }
```
- Try it out!
- Doesnt work on second passthrough
	- We are not clearing the list between runs
	- So just clear it!
- Make the list a var (not final, so we can change its contents)
```dart
List<String> selectedAnswers = [];
```
- Empty it on the setState in the chooseAnswer
```dart
 setState(() {
        selectedAnswers = [];
        activeScreen = StartScreen(switchScreen);
      });
```

---

# Results Screen
- We want to know create the results screen
![[resultsScreen.png]]
- List all Score
- List right and wrong choices
	- Probably make scrollable for longer quizes
- Have a restart button to redirect to the beginning

---

# Results Screen cont.
- Lets make a stateless widget in results_screen.dart
	- Doesnt change so this is fine
- We can see items stacked in this image
	- This is an indicator we want to use a column
	- We also want to take up the full width and have some margin for the same general feel so we can copy this from question_screen
- This is a pretty simple screen and I will put it up here 
```dart
class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key});

  @override
  Widget build(context)
  {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('You answered X out of Y questions Correctly'),
            const SizedBox(height:30,),
            const Text('List of Answers and Questions'),
            const SizedBox(height:30,),
            TextButton(
              onPressed: (){},
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
```
- We put dummy text in most of the widgets, spacing widgets between and the text button at the end has no logic yet. 
- Also the list is just a text box right now, not a list of answers. We will have to fix this
- But lets do the logic to switch to this screen
```dart
void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      //switch to the results screen
      //setting to start screen for now
      setState(() {
        selectedAnswers = [];
        activeScreen = const ResultsScreen();
      });
    }
  }
```

---

# Results Screen Revisited
- This now needs to recieve the data from the question submissions
- Parameters!
```dart
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
```
- Now need to pass the list in quiz
```dart
void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      //switch to the results screen
      //setting to start screen for now
      setState(() {
        selectedAnswers = [];
        activeScreen =  ResultsScreen(chosenAnswers: selectedAnswers);
      });
    }
  }
```
- Now we can use this on the results screen to do stuff

---

# Outputting info
- Need to combine chosen answers with the questions list
- Need to do the comparison and grading
- Make a Method to do this
	- We will make it return a List of Maps
		- ?????
![[maps.png]]
- Called a map in dart (Similar to a hashmap in java)
- Maps a value to a key
	- Generic type
	- We can give types for the keys and values
- We will map Strings to objects
	- More on this in bit
```dart
List<Map<String, Object>> getSummaryData(){
	final List<Map<String, Object>> summary = [];
	return summary;
}
```
- Could also define a class for this instead of this map, but this is another option
- Need to now populate this list
- We need to iterate through the answers submitted
	- For loop time!
```dart
for (var i = 0;i<chosenAnswers.length;i++)
{
 
}
```

---

# Populating the Map
- We need to add stuff to the map, we do this with {} to represent the data (JSON style)
- What data do we need in here?
	- Which question is this the data for?
	- What is the text of that question?
	- What was the correct answer?
	- What was the users answer submission?
- Our map object will handle this gracefully
```dart
List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer' :questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }
```

---

# Outputting the Summary Data
- We will make a new Widget for this
- We need to make sure to past it the list of maps
- We want to make a child widget in a col for everything in the list
- We will make a map like before to do this
	- Not the data type, but the function map we used before
- We will use a row for this
- Also the map is returning an iterable, we need it as a list
- Call the toList method on it
```dart
class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary({super.key, required this.summaryData});
  
  final List<Map<String,Object>> summaryData;

  @override
  Widget build(context){
    return Column(
      children: summaryData.map(
        (data){
          return Row(
            children:[],
          )
        }
      ).toList(),
    );
  }
}
```

- We also need to know populate it with some data
```dart
 Widget build(context){
    return Column(
      children: summaryData.map(
        (data){
          return Row(
            children:[
              Text(((data['question_index'] as int) +1).toString()),
              Column(
                children:[
                  Text(data['question'] as String),
                  const SizedBox(height:5,),
                  Text(data['user_answer'] as String),
                  Text(data['correct_answer'] as String),
                ],
              )
            ],
          );
        }
      ).toList(),
    );
  }
}
```
- Notice the as String and As int
- This is type casting, dart does not know what data is here so we are telling it a type 
- We can now use this in the other widget to show it
---
# Latest Results screen
```dart
Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X out of Y questions Correctly'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}

```

- Also make sure to modify the quiz.dart to not empty the list!
---
# What now
- If we run the app, we can see the data but its ugly
- We are outside of the boundaries and it doesn't look good
- In questions summary, wrap the inner col with an expanded widget
```dart
 Text(((data['question_index'] as int) +1).toString()),
              Expanded(
                child: Column(
                  children:[
                    Text(data['question'] as String),
                    const SizedBox(height:5,),
                    Text(data['user_answer'] as String),
                    Text(data['correct_answer'] as String),
                  ],
                ),
              )
```
- This will break up long lines into multiple lines
- Sounds like it takes all space it can get
	- Col takes infinite width
	- This changes it to take up only the parents width instead
- Makes that The col in the row cant take more width then the row (the parent)
---
# Scoring
- We need to get the score in here
- How do we get the values?
- Lets make variables first
- Do this in results screen
```dart
  @override
  Widget build(context) {
  final numTotalQuestions = questions.length;
  final numCorrectQuestions = 0;
```
- Need to get the summary data and think about it
- Make  also a var that grabs the summary data, and we will use a new function
- .where()
	- This returns a sublist based on the list it is run on where certain conditions are true
	- We need to pass it a function that will be executed for every item in the list
	- Basically will return true or false for each iteration and new list will be populated with the true items
- If we get all the ones where the user answer = correct answer we know we have their score
```dart
@override
  Widget build(context) {
  final summaryData = getSummaryData(); 

  final numTotalQuestions = questions.length;
  final numCorrectQuestions = summaryData.where(
    (data){
      return data['correct_answer'] == data['user_answer'];
    }
  ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions Correctly'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
```

----

# Scrolling
- Now we want to add the scrolling on the questions summary box
- Wrap the col in a sized box
	- We used this before for spacing
	- But we can give it a max height
- This by itself doesnt solve the issue
- Also need to now wrap the col in a single child scroll view
	- This widget does what its name applies
	- Takes a single child and makes that scrollable, so that if its bigger than its parent it can be scrolled
- So we made a fixed parent size, but made it scrollable


---

# Finish the results screen
1. Get better fonts
2. Make the user answer and correct answer visibilty different
3. Make the number more visible so that we can see what is the correct and incorrect questions by coloring the number and wrapping it in a circle

---

# Some notes
- Underscore is what makes a class private
	- Can use this with other properties in a class
	- just put _ in the name
- we can have getters that are a little different from what we used in the method getSummaryData
```dart
List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer' :questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {

  final numTotalQuestions = questions.length;
  final numCorrectQuestions = summaryData.where(
    (data){
      return data['correct_answer'] == data['user_answer'];
    }
  ).length;
```
- Could also do this with getShuffledAnswers
- Essentially allows a method to act like a variable
- Arrow functions
	- Type of anonymous function
- Lets look at summaryData 
```dart
final numCorrectQuestions = summaryData.where(
    (data)=> data['correct_answer'] == data['user_answer'] 
  ).length;
```
- This is shorter and usable when there is just a return statement in the body
- 