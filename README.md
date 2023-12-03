# Comprehensive Assessment of Presentation Effectiveness (CAPE)

## Description
CAPE is an evaluation management system to allow presentations to easily be created, managed, and evaluated. 
The tool is designed for classroom instructors or TAs to create presentations and have students assigned to their specific class rate the presentation on several criteria.

## Getting Started

### Prerequisites
- Ruby 3.2.2+ installed on your machine. Check your Ruby version with:
```bash
ruby --version
```

Ensure bundler is installed with `bundler --version`.
If not, run the following command:
```bash
gem install bundler
```

### Installation
1. Clone the repo
```bash
git clone https://github.com/cse3901-2023au-1020/proj6-niners.git
```

2. Navigate to the project directory
```bash
cd proj6-niners
```

3. Install dependencies
```bash
bundle install
```

4. Ensure Rails is installed
```bash
rails -v
```
Install if not:
```bash
gem install rails
```

5. Configure the database
Upon a clean installation, the database will likely need migration. To do so, perform the following:
```bash
bin/rails db:migrate
```

## Modifying the Database

### Dropping and Recreating the Database

#### Prerequisites
Ensure you have a backup of any important data before proceeding, as these steps will delete all data in your database.
Make sure you have the necessary permissions to perform database operations.

#### Steps
1. Navigate to the Rails Project
```bash
cd proj6-niners
```

2. Drop the Database
```bash
rails db:drop
```
This command will delete the database and all its data

3. Create a New Database
To create a new, empty database, run:
```bash
rails db:create
```

4. Run Migrations
Set up your database schema according to the current migration files:
```bash
rails db:migrate
```

5. Optional - Seed the Database:
If you have seed data, you can populate your database with this data using:
```bash
rails db:seed
```
The seed data file is located at `db/seeds.rb`

### Updating the Database after Modifying Migrations

#### Prerequisites
Ensure you have a backup of any important data.
Confirm that the modified migrations are compatible with your existing data or be prepared for potential data loss.

#### Steps
1. Navigate to the Rails Project
```bash
cd proj6-niners
```

2. Run Migrations
Apply the updated migrations to your database
```bash
rails db:migrate
```
This command will run any new migrations or changes to existing migrations since the last time you ran db:migrate.

3. Optional - Revert and Re-Apply Migrations
If necessary, you can revert to a previous migration and re-apply the migrations
```bash
rails db:migrate:down VERSION=your_migration_version
rails db:migrate
```
Replace `your_migration_version` with the version number of the migration you want to revert to

## Authors and Acknowledgement
Mohamed Asmali  
Steven Broaddus  
Nick Cech  
Ryan Tussing  
Nick Webber  

## Contributing
Contributions are welcome! Feel free to also open issues for major changes.
Please add corresponding tests with new features. All tests must pass before submitting a pull request.

1. Fork the Project
2. Create your new Branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the Branch (`git push origin feature/YourFeature`)
5. Open a pull request







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