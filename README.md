# Comprehensive Assessment of Presentation Effectiveness (CAPE)

## Description

CAPE is an evaluation management system to allow presentations to easily be created, managed, and evaluated. 
The tool is designed for classroom instructors or TAs to create presentations and have students assigned to their specific class rate the presentation on several criteria.

## Getting Started

### Prerequisites

Ruby 3.2.2+ installed on your machine. Check your Ruby version with:

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

5. Configure the database. Upon a clean installation, the database will likely need migration. To do so, perform the following:

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

5. Seed the Database:

If you have seed data, you can populate your database with this data using:

```bash
rails db:seed
```

The seed data file is located at `db/seeds.rb`
There is currently information in the `db/seeds.rb` file to create an Admin user. By running 

```bash
rails db:seed
```

You create that admin user with the credentials email: admin@admin.com password: adminpassword. Logging into this account will get you acccess to the administrator dashboard to monitor the database and its entries.

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
