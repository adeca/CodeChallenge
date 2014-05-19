# Lifesum CodeChallenge
by Agustín de Cabrera

https://github.com/adeca/CodeChallenge.git

=============

The application's purpose is to parse and display the contents of static JSON files. There are 4 separate sections in the app, 3 which correspond to each JSON file and a 'Settings' section. The content displayed in the 'data' sections will correspond to the language configured in the 'settings' screen.

The CoreData model has been designed to closely match the JSON structure while improving it in some aspects:
- The Category and Exercise objects contained several keys for their name in various languages. That data has been moved into a separate CoreData entity with a direct relationship to the objects. These new entities are part of the same class hierarchy since they were very much the same.
- The Food entities have a direct relationship to their corresponding category.

The parsing system has been created with modularity and flexibility in mind, abstracting duplicated behavior into common methods. A simple mapping system between the JSON keys and the CoreData attributes allows easy configuration and modification. This system has automatic type-checking built in. Usage of NSOperations allows the application to take full advantage of the multiple available threads in order to parse the JSON files in the background without affecting the user experience. A system of parsing in batches also reduces parsing time significantly.

The CoreData stack has been designed with the purpose of making it extremely simple to perform CoreData operations in a background thread. Usage of contexts with private queues allows us to merge changes into the main context only after the operations are complete and the changes are saved. The parent-child context pattern is not being used due to causing UI slowdowns, since the main context becomes a bottleneck in every save operation.

All screens use the View-Model pattern to allow clean separation between UI and model data. This enforces the separation of concerns and allows each class to have a specific focus, making the code cleaner and easier to test.

Many categories with convenience methods have been created. These methods encapsulate business related logic and also reduce boilerplate code.

## 3rd Party Frameworks

* **ADCExtensions**: A collection of useful category methods and functions. Since this library was written by myself it might no technically be '3rd party'.
* **MAKVONotificationCenter**: A wrapper over KVO which makes it much more usable.

## Pending Improvements

The visual aspect of the application leaves much to be desired. This is due to a conscious decision to prioritize the business logic and architecture parts of the application. The view model system does make it simpler to update the UI without risk of affecting the existing logic.

Testing is non-existant. While TDD will certainly help in typical projects, I decided that such a short and complex task would not be acheivable if I spent my time working on tests. Some TDD experts might disagree.
