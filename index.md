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
* Set the `resuse Identifier` for the cell with the name `studentCell` 

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

WAIT! Before we can find the index, or even find the `firstIndex(of:)` method, we need our `Student` object to be `Equatable`

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

---

#  Cohort List - Part Two

In this project, you will update the `Student List` app you created yesterday. With a tap on each Student you’ll be taken to a detail screen that shows even more information. We will use everything you’ve learned so far, and a few new tricks to complete this!

Students who complete this project independently or as a pairing will showcase their understanding of the following principles:

* Basic Storyboard constraints
* UITableviews
* Creating Custom `class` objects
* Constants, Variables, and basic Data Types
* Collections
* Functions
* Control Flow
* IBActions && IBOutlets
* Segue
* Multiple Views
---

## Clean up the workspace
Because our UI/UX team has decided that this app needs to have a detail screen for a better experience we will need to change the design a bit and delete some of your previous work. What a bummer… 

#### Before we begin create and navigate to new  git branch named `Part Two`
``` git
Git checkout Part_Two
```

If this local repo is not set up on `GitHub` either try and set it up on your own or ask an instructor for support.

Okay.. back to business

The `StudentListTableViewController` will now only display data so we no longer need the `UITextField` on the top of the screen. We also will no longer need to use the `IBAction` from our `Bar Button Item`.
* Delete the `UITextField` and the corresponding Outlet
* Delete the `AddButtonTapped` `IBAction` and it’s related connection.
	* Note: You remove the connection via the `Connections Inspector`
	* Note: We will still need the `Bar Button Item`

On the `StudentListTableViewController` file we will no longer need to extend the `StudenListTableViewController` and adopt the `UITexftFieldDelegate` protocol.  
* Delete this adoption and the extension which holds  the `textFieldShouldReturn` method.

We also no longer need our `createStudent` helper function. Delete this.

Build and run your app. Fix any bugs that may be present.
---

## Update Model
In the first section we had you create the `Student` Model with a name property and at least three additional properties.  Depending on what properties you decided to use you may not have to update your `Model`…

For this section your `Model` needs to have the following properties
* name
* cohortNumber: Int
* studentDescription

Update your model and the `Equatable` conformance accordingly.
---

## Update CRUD Functions
In the first section we had you create the `Student` Model with a name property and at least three additional properties.  Depending on what properties you decided to use you may not have to update your `create` method.

On the `StudentController`file, update your `createStudent` method to take in the correct properties. This should fix the error you most likely faced.

While we are here we should build a new method that will allow our users to `update` their `Student` Objects.
* Declare a new function named `updateStudent`
	* This should have a few parameters
		* a  `Student` object 
		* a `newName`
		* a `newCohortNumber`
		* and a `newStudentDetails`
		* Set these up with the appropriate types.
* Within the body of this method, set the properties of the `Student` object that was passed in via the parameters to the new values that were also passed in via the parameters.

Nice! Now we have no errors and a shiny `update` function! 
---

## New-New Navigation
Now that we’ve deleted some of our older code we can start building the detail screen.

* Via the `Object Library` Drop a new `UIViewController` onto the canvas. We’ve found that placing it to the right of the list view looks and feels the best.

We will need two new connections, called `Segue`s, to compete the navigation setup. One `Segue` will come from the `Bar Button Item` to the Detail Screen, and one `Segue` will come from the `UITableView Cell`

To create those `Segue`s please:
* Control-Drag from the `Add` button to the new, blank, `UIViewController`
* Control-Drag from the `studentCell` to the new, blank, `UIViewController`
	* Because this segue will be responsible for passing some data, (cool!), we will need to give this `Segue` an `Identifier`
	* Click onto the `segue` which connects the `studentCell` to the new, blank, `UIViewController`.
	* Via the `Attributes Inspector`  enter `toDetailVC` in the `Indentifier` space.

The new, blank, `UIViewController` needs to be subclassed. 
* Create a new `Cocoa Touch Class` file and name it `StudentDetailViewController`. 
* Complete the subclass by setting the `subclass` for this `ViewController` via the `Identity Inspector`.

Now is a great time to build and run your app.
---
## New-New Design
Okay! We are crushing this new design setup. We’ve got the navigation set up, so all that’s left is to add the remaining view elements onto the `StudentDetailViewController` and create the corresponding `IBAction`s and `IBOoutlets`

* Similar to what you did yesterday - add a view element that receives text onto the `Navigation Header`
* Set the `Placeholder` text to (Student Name)
* Add a new `Bar Button Item` and drop it on the right side of the `Navigation Header`.
* Set this `Bar Button Item` to `Save`

### Starting from the top down
Let’s begin our interface design by adding a `Stack View` with a `Label` and a `UITextField`.

* Drag a `Label` object from the `Object Library` and drop it onto the canvas
* Drag a `UITextField` object from the `Object Library` and drop it onto the canvas.
* Embed the  `Label`  and the `UITextField`into a `Stack View`
* Via the `Attributes Inspector` Set the labels text to `Cohort`
* Give the `UITextField` a placeholder that says what it will display
	* Enter Cohort number
* Via the `Attributes Inspector` of the `Stack View` adjust the following values
	* Set the alignment to Fill
	* Set the Distribution to Fill
	* Set the spacing to 25
* Lock in your `Stack View` with the following constraints
	* Align `Leading` and `Trailing` to 15 points to the `Safe Area`
	* Align the `Top`space to 20 points to the `Safe Area`
 
Now, we need to add a `UITextView` that will be used to describe the `Student`

* Drag a `UITextView` object from the `Object Library` and drop it under the `Stack View`
* Lock in your `UITextView` with the following constraints
	* Align `Leading` and `Trailing` to 15 points to the `Safe Area`
	* Align the `Top`space to 20 points to the `Stack View`
	* Add some placeholder text that will describe what this view will display

Let’s end our interface design by adding a `Stack View` with two `Buttons`.

* Drag two `Button` objects from the `Object Library` and drop them onto the canvas
* Embed both  `Button` s into a `Stack View`
* Via the `Attributes Inspector` Set the `Button`s titles to 
	* Clear 
	* Delete
* Via the `Attributes Inspector` of the `Stack View` adjust the following values
	* Set the alignment to Fill
	* Set the Distribution to Fill
	* Set the spacing to 5
* Lock in your `Stack View` with the following constraints
	* Align `Leading` and `Trailing` to 20 points to the `Safe Area`
	* Align the `Top`space to 20 points to the `UITextField`
	* Align the `Bottom`space to the `Safe Area`
	* This should now lock all the view elements in place and solve any constraint issues.
### Don’t forget to create the corresponding `Outlets` and `Actions ` for the view elements we just created.

Build and run dat app

---

## Back to coding! Yay!
Our plan is use the `Segue` we created from the `cell`  to pass a `Student` object to the `StudentDetailViewController`. But for that to succeed we need something to `catch` that data when it’s sent. To do this:
• On the `StudentDetailViewController` , declare a new variable named `studentreceiver` and set the type to be an optional `Student`.

Navigate to the `StudentListTableViewController` and copy the code below and paste it above the ending curly brace. We will be teaching you how this code works tomorrow 😆

``` swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let destination = segue.destination as? StudentDetailViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                let studentToPass = StudentController.shared.students[indexPath.row]
                destination.studentReciver = studentToPass
            }
        }
    }
```

While you are on the `StudentListTableViewController` add the life cycle method `viewDidAppear` and reload the tableview.

Navigate back to the `StudentDetailViewController` swift file for these next few steps.

Build a helper function that will take a `Student` objects and display the data accordingly. 
* Declare a func with a proper name for what this function will be doing.
* This method should have one parameter of type `Student` optional
* Within the body guard against `student` not having a value
* Set your view elements to display the corresponding properties from the now unwrapped `student`
* Call this function in  `viewDidload`

All we have left to do is complete the code for the buttons we have! Lets knock those out

#### Clear
Create a helper method named `clearData` with no parameters or return type.
Set the values of each of the `UITextFields` to an empty string.
Call this method in the `IBAction` for the `clearButton` 

#### Delete
Within the scope of the `IBAction` for the `deleteButton`
* Conditionally unwrap the `studetReciever`
	* If that value exists call your `deleteStudent(student:)` method from your `singleton`
	* Remove this screen and navigate back to the `StudentListTableViewController` by adding the following the code:
```swift
self.navigationController?.popViewController(animated: true)
```

#### Save
Save will be the largest and most challenging method of the three. Within the scope of the `saveButtonTapped` method
* `guard` against any of the `text` properties of the `TextFields` being nil
* Conditionally unwrap the `studentReciever` optional property.
	* If there is a value
		* Then the user navigated here via the cells segue. Which means they are trying to update a existing `Student`
		* Call your update method and pass in the unwrapped values
	* If there is not a value
		* Then the user did not navigate here via the cells segue. Which means they are trying to create a new `Student`
		* Call your `createStudent` function from your singleton.
* Outside the conditional unwrap, but within the scope of the `saveButtonTapped` method
	* Remove this screen and navigate back to the `StudentListTableViewController` 


Nice work! Build and run your app! Everything should be working - but fix any bugs that may be present! Well done.




