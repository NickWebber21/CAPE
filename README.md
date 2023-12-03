# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# TODO:
- Students should be able to make presentations
- Display list of users and corresponding presentations when making an eval
- Doesn't look like presenter can create new presentations. 
- Make email also be called username (Email/Username) since it is used to sign in
- `static_pages_controller.rb` is doesn't do anything.
- Flesh out `admin` role
- TESTS TESTS TESTS TESTS TESTS
- PRESENTATION!!!!!!!!!!!!!!!!!!!!!!!
- Needs analytical tools according to rubric :(
- Optimize page according to Lighthouse :crying emoji:

Can revise project until December 9th. Need only a demo for presentation. 

## model-setup branch
- Students can't create evals for presentations or create presentations.
- It is nice how User and Presentation autofills in create Evaluation form
- 1-5 ratings are nice for evaluations
- No easy way to see all evaluations without first clicking on a presentation, clicking new evaluation, then back to evaluations
- Due date is required?
- The `evaluations_controller.rb` has nice `@presentation = Presentation.find(params[:presentation_id])` queries that finds it for you.

## nick-styling
- Beautiful. Keep the cat.

## Questions
- Do we want survey stuff to be in the evaluations table or a separate surveys table? There will be quite a few merge conflicts due to migration file differences.
- Final migration files vs. keeping new migration files
- What roles do we want? Do we need a "Presenter" role in addition to the Instructor/TA and Student roles? Should Students instead be able to create a presentation? Note that Admins should be able to create everything.

# Steps for cloning and running the database
`git clone ...`
`ruby -v`
`bundle install` OR look into `bin/setup.rb`
Ensure port 3000 is not in use
Run `bin/rails db:migrate RAILS_ENV=development` to migrate database changes
Run `bin/rails db:schema:load` to use database schema if necessary (e.g. schema loaded from different branch of project)

Users don't need to create the database correct?
I believe the only time the user may need to create the database is if we modify past migration files (horrible practice), in which case they need to drop the entire database and then create it again (unthinkable). They should also need to test the new database. Regardless, shown below is how to do this:
`rails db:drop`
`rails db:create`
`rails db:migrate`  Note that development is the default value of `RAILS_ENV`