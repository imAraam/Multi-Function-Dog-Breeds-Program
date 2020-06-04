#### Haskell

Unlike static, imperative, and more modern dynamic languages, Haskell requires a different approach from the developer. A different mindset is required to understand and fully utilise functional programming, because Haskell is a language that takes immutable values as inputs and provides new values as an output. The fundamental idea of functional programming is that software is built by putting together pure functions with those immutable values. Haskell is also statically typed, the compiler must be made aware of the data types of different variables which allow catching several errors at compile time. Because of that, developing software with better quality and code that needs less bug fixes and maintenance, is made easier with the use of a purely functional programming language like Haskell. 

However, Haskell can be much more concise compared to some other languages. It does have some drawbacks. The main one being the learning curve. As functional programming requires a different type of thinking, I found it difficult to learn and it took me some time to adjust to thinking in a functional manner. Another drawback which I faced difficulty with was assembling Haskell. Finding a text editor and installing the GHC on a Windows platform proved challenging and time consuming. Much so that I had to eventually switch to an Ubuntu system and install the dependency management tool stack  just to be able to begin development of my program. However, if those drawbacks can be overcome then Haskell is a very powerful language for development.


### Assignment Description

Apply the test-driven development approach to the development of functional-style code written
in the Haskell programming language. Choose any algorithm/application to
develop, it should be complex enough that it can be broken down into multiple functions
each requiring multiple tests during the test-driven development process. Utilise Haskell libraries that provide unit-testing tools.


## Test-Driven Development Introduction

Test driven development is the practice of writing automated test cases for the purpose of the development of application logic. The basic premise of TDD is to write simple tests, typically unit-tests, for the application logic before writing that functionality. This discipline is an important agile design technique as it allows for the development of clean code. That is because the design and requirements of the system are present before the developer begins implementing the functionality.

This involves breaking down the required behaviour of the application into small functions and creating test cases for each of those functions. The test cases should be designed to fail, that is because the test cases will be written before any application logic. Therefore, there will be no functionality present to test. After that, the developer writes the minimum code possible to pass the test for a given function. Once the test successfully passes, the developer proceeds to refactor the code to increase readability and efficiency in the program, and then test it again. Once a satisfactory level of code refactoring has been reached. The test-driven development cycle has been achieved and the developer can move on to writing tests for other parts of the application. 

That is the fundamental distinction between TDD and other practices. The core idea of designing and writing failing tests for functionality that has not yet been developed. Allowing the implementation of that required functionality to be done properly and objectively. As well as, giving the developer clarity of what needs to be accomplished at any given point of the development cycle.

## Benefits of TDD

•	Detailed specification:
As the automated tests are written before the functionality is implemented, the developer is aware of their objectives when writing the application logic. Presenting the developers with clear and concise specifications of how the system is intended to behave. 

•	Ability to write SOLID code in object-oriented design:
SOLID stands for:
o	Single Responsibility Principle: Requiring every class to have a single responsibility, not more.
o	Open/Closed Principle: Software should be open for extension but closed for modification.
o	Liskov Substitution Principle: Stating that sub/derived classes should be replaceable with base classes without altering the correctness of the program.
o	Interface Segregation Principle: States that multiple interfaces, are better than one general-purpose interface. 
o	Dependency Inversion Principle: Stating that abstractions should not depend on details, but vice versa.  
SOLID helps in constantly improving the code and avoiding bad code development practices, such as, tight coupling and premature optimization. 

•	Allows maintainability and flexibility:
As the tests are written before the code that implements the functionality, it makes the code generally easier to understand. Due to methods being responsible for singular purposes, understanding how these functions are meant to interact with one another is made simpler. This allows for maintainability and flexibility for future developers trying to make alterations to the code. 

•	Allows bugs to be easily identified:
The use of TDD allows the developer to locate where errors in the application are happening as the tests will display exactly which aspect of the application is failing. 

•	Improves quality:
With proper use of good coding practices, code refactoring can be used to significantly improve the quality of the code and the efficiency of the program. Providing a result of higher quality than what would be achieved without the use of TDD.

## Narrative Account

The development of the Haskell program began by first deciding what the program was going to be about. Which was a dog breeds program that provides options to the users such as displaying available dog breeds, displaying specific details of a breed, calculating the weight of a fully grown dog etc. Once the functionality and behaviour of the program was decided, the test suite design could begin. The first step of that was to choose which Haskell testing framework to utilise, that ended up being the Tasty framework (more details in Testing Tools Used). As the program required custom types for the dog breeds, as well as functions to perform calculations. Property and custom type testing with QuickCheck was a possibility to include in the test suites. That however, could not be applied to the TDD practice as the functionality needed to be present before the QuickCheck functions and prop tests could be developed.

The next step was to write the unit tests that allowed the required behaviour of the application to be tested and include the test suite in the stack generated .yaml file. With the help of Tasty’s HUnit , the unit tests were written to express the desired outcomes of the various functions. Each of the unit tests were added to their respective group of the area of the application being tested. For example, the conversion unit tests were added to a conversion test group, while the weight calculations unit tests were added to the weight calculations test group. All these groups together were added to a unit tests test tree, which in turn was added to a tests test tree (to allow QuickCheck tests to be added later). That helped facilitate automated testing which greatly aided in the efficient development of the program.

Once the automated tests were in place, the development of the functionality could begin. As not all functionalities of the application were connected (outside of the main loop), there was no urgency in beginning development with any certain aspect of the program. Therefore, development commenced with the conversion tests and weight calculations tests. The simplest code was written to pass the tests and once that was achieved, the functions were refactored to eventually introduce the use of higher order functions to increase efficiency and readability. Those steps were repeated with the remaining aspects of the program until all the desired functionality was implemented, refactored and was behaving in the intended manner. 

The final step was to introduce property based and custom type test suites. As previously mentioned, this could not be included in the TDD practice as the program being developed and therefore the tests required for that program were not suitable for TDD. That is because the application logic was required to be present in the prop functions themselves. In addition, the custom type needed to be implemented first to facilitate the testing of it using QuickCheck. Therefore, once the development of the application logic was complete, the QuickCheck test suite was introduced. That was done with the help of Tasty’s QuickCheck . As previously explained, each QuickCheck test was included in a separate test group, which in turn was included in the main properties test tree, which finally was added to the tests test tree to facilitate automated testing. QuickCheck was used to property test the conversions and weight calculations, as well as, the correct retrieval of custom type elements and the addition of a breed. That was done through prop functions which were then tested in their respective test groups.

