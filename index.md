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
- Write comments for every line of code within your project explaining what It does

---
