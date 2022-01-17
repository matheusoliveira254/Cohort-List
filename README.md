# Cohort List

In this project, you will use your knowledge of Swift to build an app that displays basic Student data for a school! We will use everything you’ve learned so far to complete this!

Students who complete this project independently or as a pairing will showcase their understanding of the following principles:

* Basic Storyboard constraints
* UITableviews
* Creating Custom `class` objects
* Constants, Variables, and basic Data Types
* Collections
* Functions
* Control Flow
* IBActions && IBOutlets

## Design
Our Cohort List app will display `Student` objects in a `UITableView` also known as a list view. For this project, we will only be displaying one property, `name`, and using a plus (+) button to create the `Student` objects. It's gonna be great! Let's get started…

* The first thing we will want to do is create our views.

Before we begin please delete both the `ViewController.swift` file, along with the default `View` on the `Main` storyboard.

Navigate to the `Object Library` and drag onto the canvas a `UITableViewController`. 

Embed the new `UITableViewController` into a `NavigationController`
Be sure to set this as the initial view.
While we are setting up the initial settings of the `Table View`, this would be a great time to create the `.swfit` file that will manage this screen. 

* Create your `.swift` file by navigating to File -> New -> File…
* Because this file will be responsible for a `view` we will want to use the `Cocoa Touch Class` template. 
* Name this file `StudentListTableviewController`. 
	* Be sure to have this file be a `Subclass` of `UITableViewController`

Now that this file exists we need to link, or subclass, our `UITableViewController` to our `StudentListTableviewController`. 

* To do this navigate back to your storyboard, select the 	`UITableView Controller` scene in the `view hierarchy`. 
* With the `scene` selected show the `Identity Inspector` and using the drop down menu for `Class` select  `StudentListTableViewController`

Pausing here to build and run is a great practice. Your app should build and display a blank `UITableviewController`

Now to add the view elements.

* Navigate to your `Object Library` and drag a `Bar Button Item` to the top left of the scene. Update the item to be an `Add` item.
* We will need a view element that will receive text from the user. Drag the appropriate element onto the canvas `ABOVE` the prototype cells.
* Give this element a `Placeholder` of `Enter Name of Meal Here...`
* You do not need to constrain this item, or the `Bar Button Item` they will use their intrinsic constraints.
* Update the style of the `Table View Cell` to `Basic` via the `Attributes Inspector` with the cell selected.

Pause here to build and run. Your app should build and display a blank `UITableviewController`with a view element that receives text, and a blue (+) plus button. 

Great work!

---

### Model

Our app will only have one Model at this time. `Student`

* Create a new, blank `.Swift` file with your Models name.
* On this file declare a new `class` with the same name as your file.
* Create at least three properties for your `Student` object.
* One property needs to be `name` and set to the proper data type.
* Create your member-wise initializer. 

Ain’t it a beaut?

---

### Model Controller
Each Model should have a `Controller` to manage its state.

* Create a new, blank `.Swift` file with the name `StudentController`. 

* Declare a new class with the same name as your file. 

This file will need to handle a few things for us. First, our `Controller` controls all the `CRUD` functions for our `Student` Object. Once created, updated, or deleted, we need a collection that holds the `Student`objects. We also need a way to ensure that when we reference our `students` collection we are referencing the same `instance` of that collection. Now that we know our goals, let’s get building!

If you feel comfortable - try and create this file without the instructions

Let’s start with writing our `Singleton`. Remember - the `Singleton` ensures that whenever we access the `Singleton` we will be accessing the same `instance` of that class.

``` swift
static let sharedInstance = StudentController()
```

Write a comment under this line that describes your understanding of what a singleton is and why you want one.

Now let's create our `Collection`

Declare a new variable with the name `students`. The type should be an array of students. Set a default value of an empty array

Make a mark that states the following code will be your `CRUD` functions

---

#### Create
Declare a new `func` named `createStudent` with one parameter which is a string. This does not need to return any information
Within the body of this function initialize a new `Student` object.
	* Use the value of the parameter for the `name` property
	* Set default values for your other properties
	Once the `newStudent` has been created, append that element to your collection.

#### Delete
Declare a new `func` named `deleteStudent` with a parameter of type `Student`
To delete this object in our collection we first need to know `where` in the collection the object is. To do that we will create a new constant named `index` and assign the result of the `firstIndex(of:)` function from the `students` array.

WAIT! Before we can find the index, or even find the function `firstIndex(of:)` method, we need our `Student` object to be `Equatable`

Navigate back to your Model and conform to the `Equatable` protocol.
``` swift
extension Student: Equatable {
    static func == (lhs: Student, rhs: Studnet) -> Bool {
        return lhs.name == rhs.name
 // && lhs.yourOtherProp == rhs.yourOtherProp ...

    }
}
```

Be sure to check the equality of all the properties of the `Student` Object.
Navigate back to the `StudentController` file

Now that our `Student` object conforms to `Equatable` we can use the `firstIndex(of:)` function that is on the `students` collection.
With that `index` use the `remove(at:)` method on the `students` array to remove that object.

``` swift
func deleteStudent(_ student: Student) {
        guard let index = students.firstIndex(of: student) else {return}
		students.remove(at: index)
    }
```

Great work!

## Wiring up the Views
Here is where the magic happens! On our `View Controller` we will write the code to display all our data to our users!

One of our first goals is to create the `outlets` and `actions` we will need. Please create an outlet for the `UITextField` and an action for the `+` button. Be sure to place your `IBOutlet` above the `viewDidLoad` and the `IBAction` below the `viewDidLoad`

To display our students we will need to update the `numberOfRowsInSection` method to return the number of students in our array. Use `dot notation` to access our `StudentController` File, specifically the `sharedInstance` to then access our `students`and finally the `count` property. 

Uncomment the `tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)` method. With the body, if the `editingStye` is equal to `.delete` we will need to perform the following tasks

• create a new constant that has the value of a  `Student` object.
	• Using Subscript Syntax, and the `indexPath.row` 
• Pass that new constant to the `deleteStudent` method on the shared instance of your `Model Controller`
	• Be sure to write this code before where the `tableView` deletes the rows

Let’s create a helper function that allows us to create the student objects.
Declare a new function named `createStudent` with no parameters or return.

Within the body of this function, we need to create a constant from the value of the `text` property of the `UITextField` we connected above. 
	* Be sure to handle the optional
* Then, access the `createStudent` method using the `sharedInstance` and pass the new `constant` in
* Set the `text` of the `studentTextField` to an empty string
* Reload the `tableview`

Now call this helper function in the body of the `IBAction` you created before.

We are so close! 

All we have left to do is allow the keyboard of our `UITextfield` to be dismissed. Extend the `StudenListTableViewController` to adopt the `UITexftFieldDelegate` protocol.   Then, create the `textFieldShouldReturn` method and call your `createStudent()` method within its scope.

``` swift
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        createStudent()
        return true
    }
}
```

In the `viewDidload` function assign your `StudentListTableViewController` to be the `UITextField` ’s delegate.
``` swift
override func viewDidLoad() {
        super.viewDidLoad()
        nameTextfield.delegate = self
    }
```

Okay! Build and run your app! Test the functionality and fix any bugs present.


# Stretch goals
* Add a second `UITextField` to set a second property. Display the updated information
* Write comments for every line of code within your project explaining what It does
