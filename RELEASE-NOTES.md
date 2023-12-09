# Comprehensive Assessment of Presentation Effectiveness (CAPE)

## Description

CAPE is an evaluation management system to allow presentations to easily be created, managed, and evaluated.
The tool is designed for classroom instructors or TAs to create presentations and have students assigned to their specific class rate the presentation on several criteria.

## Release Notes

### Database Update

#### Courses

Added a new Courses table to record all user courses. An instructor can create a course and then make an account. The only way to create an instructor account now, is to first make a course.
There is no dropdown option when creating a user.

An instructor can edit or delete a course, deleting all users, presentations, and evaluations under it.

A User, and Presentation belong to a Course. A Course can have many presentations and many users.

#### Devise Users

A User/Registrations controller was created to pass variables to the Devise sign up page. The Users controller was also updated to give the instructor special features like changing the role of a student(makeing them a ta).

### Style Updates

#### Navbar

In addition to the original Home, About, and Help pages, the Sign In, Sign Up,
and Sign Out buttons are now positioned in the navbar.

A second navbar was added to allow for easy navigation between the Presentations,
Evaluations, and Roster pages. The Home page link was moved to the second nav bar when a user is signed in for better ease of use.

#### Content Boxes

All instances of information that is shown to the user have been placed into bordered boxes or buttons. This allows the user to see
bite-sized pieces of information that they can easily distinguish from other pieces of information. In the proper places, colored buttons
have also been placed alongside content to make navigation easier.

### Content

#### Home Page Content

The Home Page has been reorganized to more effectively display information. The title has been condensed to a single line,
while the account settings page has been placed in a welcome message that users can easily access. A user can also easily
see the class they are enrolled in.

Multiple headers have been added to describe useful information in one area.

Evaluations that a User still needs to fill out has been added to the Home Page.

#### Content Filtering

On most pages that display useful information to the user, the relevant information (Presentations, Evaluations, Rosters) has been
filtered into different categories so that content is easier to digest. For example, on the Home page, Presentations are split
into sections of your own Presentations and other users' Presentations. On the Evaluations page, a user can easily see both Evaluations
on their work and the Evaluations that they wrote.

#### Expansion of Evaluation Details

The full-length labels for the evaluation questions, intially only shown on the Evaluation form, are now visible in a full table
that can be easily digested by a user.

#### Overall Content Changes

Minor changes were made in various places to update logic, include more information, and add styling.


### CanCanCan

#### Evaluations

The authorization permissions on Evaluations were changed to ensure that a user can see all of the Evaluations relevent to them -
the Evaluations they wrote and the evaluations that are on their presentation. Instructors can see all Evaluations.

### TA Role

The role of TA was added with the same CanCanCan permissions as an Instructor but with a few minor tweaks. A TA cannot edit the course nor can they edit other users in a class.
Other than that, they have the same view as an Instructor.
