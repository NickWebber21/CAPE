# Presentation Evaluation 

## Description



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
- Complete README
- Students create/edit evaluations links are broken
- When displaying the entire tables, it would be nice to also display the primary key `id` to differentiate between records with same data. This may be unnecessary though
- Currently, new evaluations are filled out with the User filling out the evaluation but there is no way to associate presenters with the presentation
    - Authors table is going to fix this
    - MAKE `user_id` and `presentation_id` unique in both Authors and Evaluations tables and validate them.
- No easy way for professors to see all evaluations without first clicking to show a presentation, clicking new evaluation, then back to evaluations
- Flesh out `admin` role
    - Include link to see all tables & records
    - Possibly include ability to create a new user/presentation/eval
    - Needs analytical tools according to rubric
- See list of evaluations. Note that both Instructors and Students should be able to see all presentations for their class.
    - Instructor should be able to see all evaluations.
    - Students should only be able to see their own evaluations and ones that pertain to their presentations.
- tests? <-- Mostly unneeded.
- PRESENTATION!!!!!!!!!!!!!!!!!!!!!!!
- Optimize page according to Lighthouse :crying emoji:
- To prevent students from being able to identify as instructors/TAs, we can have a table for classes and have students join the class. This will be more complex and so we will only do this if other people do something similar.

Can revise project until December 9th. Need only a demo for presentation. 

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