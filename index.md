# Cohort List

In this project, you will use your knowledge of Swift to build an app that displays basic Student data for a school! We will use everything you’ve learned so far to complete this!

Students who complete this project independently or as a pairing will showcase their understanding of the following principles:

- Basic Storyboard constraints
- UITableviews
- Creating Custom `class` objects
- Constants, Variables, and Basic Data Types
- Collections
- Functions
- Control Flow
- IBActions && IBOutlets

## Design

Our Cohort List app will display `Student` objects in a `UITableView` also known as a list view. For this project, we will only be displaying one property, `name`, and using a plus (+) button to create the `Student` objects. It's gonna be great! Let's get started…

1. The first thing we will want to do is create our views.

BEFORE WE BEGIN: Please delete both the `ViewController.swift` file, along with the default `View` on the `Main` storyboard.

1. Now that this storybook is empty, navigate to the `Object Library` and drag onto the canvas a `UITableViewController`.
2. Embed the new `UITableViewController` into a `NavigationController`
Be sure to set this as the initial view.

While we are setting up the initial settings of the `Table View`, this would be a great time to create the `.swfit` file that will manage this screen.

1. Create your `.swift` file by navigating to File -> New -> File…
2. Because this file will be responsible for a `view` we will want to use the `Cocoa Touch Class` template.
3. Name this file `StudentListTableviewController`.
    - Be sure to have this file be a `Subclass` of `UITableViewController`
4. Now that this file exists we need to link, or subclass, our `UITableViewController` to our `StudentListTableviewController`.
5. To do this navigate back to your storyboard, and select the	`UITableView Controller` scene in the `view hierarchy`.
6. With the `scene` selected show the `Identity Inspector` and using the drop-down menu for `Class` select `StudentListTableViewController`
7. Set the `reuse Identifier` for the cell with the name `studentCell`

Pausing here to build and run is a great practice. Your app should build and display a blank `UITableviewController`

Now to add the view elements.

1. Navigate to your `Object Library` and drag a `Bar Button Item` to the top left of the scene.
    - Update the item to be an `Add` item.
2. Drag a `UIView` element and hover it UNDER the navigation item - yet ABOVE the `tableview`. **You should see a blue line appear.**
    - Release to set the `UIView` element in the proper position.
    - To view this element easier, change the background color
    - Hover your cursor to the bottom-middle of the `UIView`. You should see an icon that looks like a black bar with an up and down arrow.
    - Using this icon, click and drag the `view` until the height is set to `100`
3. Great! Now we need to drop two `UITextField`s’ into that view.
    - Give the top element a `Placeholder` of `Enter Student name...`
    - Give the bottom element a `Placeholder` of `Enter Cohot ID...`
4. Let's lock the text fields in place by embedding them into a `vertical` stackview
    - Alignment: Fill
    - Distribution: Fill Equally
    - Spacing of 4
5. Update the style of the `Table View Cell` to `Right Detail` via the `Attributes Inspector` with the cell selected.

Pause here to build and run. Your app should build and display a blank `UITableviewController`with two view elements that receive `text` with some placeholder text, and a blue (+) plus button.

- Currently, no cells should be displayed

### Great work!

Now is a great time to make a commit to Github.

---

## Model

Our app will only have one Model at this time. `Student`

1. Create a new, blank`.Swift` file with your Models name.
2. On this file declare a new `class` with the same name as your file
    - Remember - This should be Capitalized
3. Create the two properties for your `Student` object.
    1. Name
    2. Cohort ID
4. Create your member-wise initializer.
    1. Feel free to review the video [classes](https://player.vimeo.com/video/664057680?h=0c1d398ab2) for information on what a `member-wise initializer` is and how to write one. As always, you’re welcome to use external resources such as Google and Stack Overflow.

### Ain’t it a beaut?

Commit?

---

### Model Controller

Each Model should have a `Controller` to manage its state.

- Create a new, blank`.Swift` file with the name `StudentController`.
- Declare a new class with the same name as your file.

This file will need to handle a few things for us. First, our `Controller` controls all the `CRUD` functions for our `Student` Object.

### What is CRUD?

- Create
- Reuse
- Update
- Delete

Once created, updated, or deleted, we need a collection that holds the `Student` objects. We also need a way to ensure that when we reference our `students` collection we are referencing the same `instance` of that collection. Now that we know our goals, let’s get building!

## Challenge yourself to create this file without the instructions

1. Let’s start with writing our `Singleton`. Remember - the `Singleton` ensures that whenever we access the `Singleton` we will be accessing the same `instance` of that class.
    - How do I write this?
        
        ```swift
        static let sharedInstance = StudentController()
        ```
        
2. Write a comment under this line that describes your understanding of what a singleton is and why you want one.

Now let's create our `Collection`

1. Declare a new variable with the name `students`. The type should be an `array` of students.
    - Set a default value of an empty array
2. Make a mark that states the following code will be your `CRUD` functions

---

### Create

1. Declare a new `func` named `createStudent` with the parameters you need. This does not need to return any information
2. Within the body of this function initialize a new `Student` object.
    - Use the value of the  correct parameter for the `name` property
    - Use the value of the correct parameter for the `cohortID` property
3. Once the `newStudent` has been created, append that element to your collection

### Great work!

Commit time!

---

## Wiring up the Views

Here is where the magic happens! On our `View Controller`, we will write the code to display all our data to our users!

1. One of our first goals is to create the `outlets` and `actions` we will need. 
    - Create an outlet for each of the `UITextField`s
    - Create an action for the `+` button.
    - Be sure to place your `IBOutlet` above the `viewDidLoad` and the `IBAction` below the `viewDidLoad`
    

To display our students we will need to update the `numberOfRowsInSection` method to return the number of students in our array.

- Use `dot notation` to access our `StudentController` File, specifically the `sharedInstance` , then access our `students`, and finally the `count` property.

The next step in allowing the data to be displayed is to complete the `cellForRowAt()` data source method

1. Uncomment the `override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)` method
2. Update the value of the `reuseIdentifier` with the same string you set on the storyboard.
3. Create a constant named `students`, and assign the value of the `students`array from your `sharedInstance`
4. Create a constant named `studentToDisplay`
    1. Assign the value of whatever `student` object matches the `indexPath.row` property
5. Now all we need to do is set the text of the cell to display the data
    1. Assign the `name` from the `studentToDisplay` to the `text` of the `textLabel` on the cell
    2. Assign the `cohortID` from the `studentToDisplay` to the `text` of the `detailTextLabel`on the cell
    
    That should take care of all the code we need to display the cohorts’ information. We now only need a way to capture the text from the text fields and then create our student objects using that data.
    

Let’s create a helper function that allows us to create the student objects.

1. Declare a new function named `createStudent` with no parameters or return.
    1. Call this in the `IBAction` for the (+) button you created earlier
2. Within the body of this function, we need to create two constants from the value of the `text` property of the `UITextField`(s) we connected above.
    - Be sure to handle the optional
3. Then, access the `createStudent` method using the `sharedInstance` and pass the new `constants` in
4. Set the `text` of the `studentNameTextField` to an empty string
5. Set the `text` of the `cohortIDTextField` to an empty string
6. Reload the `tableview`
7. If you have not already... call this helper function in the body of the `IBAction` you created before.

Okay! Build and run your app! Test the functionality and fix any bugs present.

# Stretch goals

- Solve the bug where someone can create a student with empty Strings.
- Write comments for every line of code within your project explaining what It does.

---

# Cohort List - Part Two

In this project, you will update the `Student List` app you created yesterday. With a tap on each Student you’ll be taken to a detail screen that shows even more information. We will use everything you’ve learned so far, and a few new tricks to complete this!

Students who complete this project independently or as a pairing will showcase their understanding of the following principles:

- Basic Storyboard constraints
- UITableviews
- Creating Custom `class` objects
- Constants, Variables, and basic Data Types
- Collections
- Functions
- Control Flow
- IBActions && IBOutlets
- Segue
- Multiple Views

---

## Clean up the workspace

Because our UI/UX team has decided that this app needs a detail screen for a better experience, we will need to change the design a bit and delete some of your previous work. What a bummer…

### Before we begin, create and navigate to a new git branch named `Part Two`

```bash
$ git checkout -b Part_Two
```

The `StudentListTableViewController` will now only display data, so we no longer need the `UIView`nor the `UITextField`(s) on the top of the screen. We also will no longer need to use the `IBAction` from our `Bar Button Item`.

1. Delete the `UIView`
    - This should also delete the `UITextField`(s)
    - Double-check that the connections have been deleted
2. Delete the Outlets if you have not already
3. Delete the `AddStudentButtonTapped` `IBAction` and it’s related connection.
    - Note: You remove the connection via the `Connections Inspector`
    - Note: We will still need the `Bar Button Item`
    

On the `StudentListTableViewController` file we will no longer need our `createStudent` helper function. Delete this.

## Build and run your app. Fix any bugs that may be present.

---

## Update Model

In the first section we had you create the `Student` Model with a `name` property and a `cohortID` property. We will be adding a new property so you will need to update your `Model`…

For this section your `Model` needs to have the following properties

- name
- cohortID
- studentDescription
1. Update the initializer accordingly.

---

## Update CRUD Functions

In the first section we had you create the `Student` Model with a `name` property and a `cohortID` property. Because we added the new `studentDescription` property you will need to update your `create` method.

### Create

On the `StudentController`file, update your `createStudent` method to take in the correct properties. 

### Update

While we are here we should build a new method that will allow our users to `update` their `Student` Objects.

1. Declare a new function named `updateStudent`
    - This should have a few parameters
        - a `Student` object
        - a `newName`
        - a `newCohort`
        - and a `newStudentDetails`
    - Set these up with the appropriate types.
2. Within the body of this method, set the properties of the `Student` object that was passed in via the parameters to the new values that were also passed in via the parameters.

### Delete

1. Declare a new `func` named `deleteStudent` with a parameter of-type `Student`
2. To delete this object in our collection we first need to know `where` in the collection the object is. To do that we will create a new constant named `index` and assign the result of the `firstIndex(of:)` function from the `students` array.
    
    <aside>
    💡 WAIT! Before we can find the index, or even find the `firstIndex(of:)` method, we need our `Student` object to adopt and conform to the `Equatable` protocol.
    
    </aside>
    
3. Navigate back to your Model.
    - Extend the `Model` to adopt the `Equatable` protocol.
    - Within the extension, conform to the `Equatable` protocol
    
    ### How do I write this?
    
    ```swift
    extension Student: Equatable {
        static func == (lhs: Student, rhs: Student) -> Bool {
            return lhs.name == rhs.name &&
            lhs.age == rhs.age &&
            lhs.favoriteColor == rhs.favoriteColor
        }
    }
    ```
    
4. Be sure to check the equality of all the properties of the `Student` Object.
Navigate back to the `StudentController` file

Now that our `Student` object conforms to `Equatable` we can use the `firstIndex(of:)` function that is on the `students` collection.

1. With that `index` use the `remove(at:)` method on the `students` array to remove that object.

### How do I write this?

**Great work! Please make a commit with all the wonderful work you just completed.** 

---

## New-New Navigation

Now that we’ve deleted some of our older code we can start building the detail screen.

1. Via the `Object Library` Drop a new `UIViewController` onto the canvas. We’ve found that placing it to the right of the list view looks and feels the best.

We will need two new connections, called `Segue`s, to compete the navigation setup. One `Segue` will come from the `Bar Button Item` to the Detail Screen, and one `Segue` will come from the `UITableView Cell`

To create those `Segue`s please:

1. Control-Drag from the `Add` button to the new, blank, `UIViewController`
2. Control-Drag from the `studentCell` to the new, blank, `UIViewController`

Because this segue will be responsible for passing some data, (cool!), we will need to give this `Segue` an `Identifier`

- Click onto the `segue` which connects the `studentCell` to the new, blank, `UIViewController`.
- Via the `Attributes Inspector` enter `toDetailVC` in the `Indentifier` space.
1. The new, blank, `UIViewController` needs to be subclassed.
    - Create a new `Cocoa Touch Class` file and name it `StudentDetailViewController`.
    - Complete the subclass by setting the `subclass` for this `ViewController` via the `Identity Inspector`.

## Now is a great time to build and run your app.

Commit. Drink Water.

---

## New-New Design

Okay! We are crushing this new design setup. We’ve got the navigation set up, so all that’s left is to add the remaining view elements onto the `StudentDetailViewController` and create the corresponding `IBAction`s and `IBOoutlets`

1. Similar to what you did yesterday - add a view element that receives text onto the `Navigation Header`
    - No need to constrain this
    - set the `Placeholder` text to (Student Name)
2. Add a new `Bar Button Item` and drop it on the right side of the `Navigation Header`.
    - Set this `Bar Button Item` to `Save`

### Starting from the top down

Let’s begin our interface design by adding a `Stack View` with a `Label` and a `UITextField`.

1. Drag a `Label` object from the `Object Library` and drop it onto the canvas
2. Drag a `UITextField` object from the `Object Library` and drop it onto the canvas.
3. Embed the `Label` and the `UITextField`into a `Stack View`
4. Via the `Attributes Inspector` Set the labels text to `Cohort`
5. Give the `UITextField` a placeholder that says what it will display
    - Enter Cohort number
6. Via the `Attributes Inspector` of the `Stack View` adjust the following values
    - Set the alignment to Fill
    - Set the Distribution to Fill
    - Set the spacing to 25
7. Lock in your `Stack View` with the following constraints
    - Align `Leading` and `Trailing` to 15 points to the `Safe Area`
    - Align the `Top`space to 20 points to the `Safe Area`
    

Now, we need to add a `UITextView` that will be used to describe the `Student`

1. Drag a `UITextView` object from the `Object Library` and drop it under the `Stack View`
2. Lock in your `UITextView` with the following constraints
    - Align `Leading` and `Trailing` to 15 points to the `Safe Area`
    - Align the `Top`space to 20 points to the `Stack View`
    - Add some placeholder text that will describe what this view will display
    

Let’s end our interface design by adding a `Stack View` with two `Buttons`.

1. Drag two `Button` objects from the `Object Library` and drop them onto the canvas
2. Embed both `Button` s into a `Stack View`
3. Via the `Attributes Inspector` Set the `Button`s titles to
    - Clear
    - Delete
- Via the `Attributes Inspector` of the `Stack View` adjust the following values
    - Set the alignment to Fill
    - Set the Distribution to Fill
    - Set the spacing to 5
1. Lock in your `Stack View` with the following constraints
    - Align `Leading` and `Trailing` to 20 points to the `Safe Area`
    - Align the `Top`space to 20 points to the `UITextField`
    - Align the `Bottom`space to the `Safe Area`
    - This should now lock all the view elements in place and solve any constraint issues.

### Don’t forget to create the corresponding `Outlets` and `Actions`  for the view elements we just created.

Build and run dat app. Commit.

---

## Back to coding! Yay!

Our plan is to use the `Segue` we created from the `cell` to pass a `Student` object to the `StudentDetailViewController`. But for that to succeed we need something to `receive` that data when it’s sent. 

To do this:

1. On the `StudentDetailViewController`, declare a new variable named `studentreceiver` and set the type to be an optional `Student`.

Navigate back to the `StudentListTableViewController`

### Segue

1. Uncomment the `prepare(for segue: UIStoryboardSegue, sender:Any?)` function. 

Within the body of this function, we need to double-check a few items before we can pass the `student` object to the `StudentDetailViewController`. 

We first need to know what segue was triggered. If that was the one we expected, we need to know if the `destination` of that `segue` is where we are trying to go - the `StudentDetailViewController`. If it is, then we need to know what `cell` the user tapped on so we can find the corresponding `book` object in our array. Once we have that we can pass that data along. 

Let's write the code that matches our goals:

1. Create a conditional that checks if the `segue.identifier` is equal to the `String` you set for the identifier of the `segue` we made on the `Interface Builder`
    - If you haven’t done that.. you should
2. If that is true, conditionally typecast the `segue. destination` `as?` the type of `ViewController` we aim to move the data to
3. On the same conditional let's unwrap the `indexPath` for the selected row
4. Using that `indexPath` assign the corresponding value from the `student` array to a new constant named `studentToPass`
5. Assign the `student`property of the `destination` to the value of `studentToPass`

While you are on the `StudentListTableViewController` add the life cycle method `viewDidAppear` and reload the tableview.

### How do I write this?

```swift
// In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // MARK: - IIDOO
        /// Identifier - We are checking to see if the identifier of our segue matches "toDetailVC". If it does then we will run the code inside, if not then we will just pass over it.
        if segue.identifier == "toDetailVC" {
            /// Index - Discovering what row the user has seleceted
            if let index = tableView.indexPathForSelectedRow {
                /// Destination - Verifying the segues destination leads to the *ViewController* we want. This also allows us to access the properties on that *ViewController*
                if let destination = segue.destination as? StudentDetailViewController {
                    /// Object to send - Using the index we discovered earlier we retrieve the *Student* that matches in our *students* array.
                    let student = StudentController.sharedInstance.students[index.row]
                    /// Object to receive - Sets the value of the optional *student* on the *destination* to the *student* we just retrived.
                    destination.student = student
                }
            }
        }
    }
```

Well done! You just rocked a segue! More RedBull and a commit?

---

### Detail VC final steps

Navigate back to the `StudentDetailViewController` swift file for these next few steps.

Build a helper function that will take `Student` objects and display the data accordingly.

1. Declare a func with a proper name for what this function will be doing.
2. This method should have one parameter of type `Student` optional
3. Within the body, guard against `student` not having a value
4. Set your view elements to display the corresponding properties from the now unwrapped `student`
5. Call this function in `viewDidload`

All we have left to do is complete the code for the buttons we have! Let's knock those out

### Clear

1. Create a helper method named `clearData` with no parameters or return type.
2. Set the values of each of the `UITextFields` to an empty string.
3. Call this method in the `IBAction` for the `clearButton`

### Delete

Within the scope of the `IBAction` for the `deleteButton`

- Conditionally unwrap the `studetReciever`
    - If that value exists call your `deleteStudent(student:)` method from your `singleton`
    - Remove this screen and navigate back to the `StudentListTableViewController` by adding the following the code:

```swift
self.navigationController?.popViewController(animated: true)
```

### Save

Save will be the largest and most challenging method of the three. Within the scope of the `saveButtonTapped` method

- `guard` against any of the `text` properties of the `TextFields` being nil
- Conditionally unwrap the `studentReceiver` optional property.
    - If there is a value
        - Then the user navigated here via the cells segue. This means they are trying to update an existing `Student`
        - Call your update method and pass in the unwrapped values
    - If there is no value
        - Then the user did not navigate here via the cells segue. This means they are trying to create a new `Student`
        - Call your `createStudent` function from your singleton.
- Outside the conditional unwrap, but within the scope of the `saveButtonTapped` method
    - Remove this screen and navigate back to the `StudentListTableViewController`
        - Reference how you did this in the Delete function

### Nice work! Build and run your app! Everything should be working - but fix any bugs that may be present! Well done.

Be sure to commit the final working project and submit the link via the text box on Learnupon.
