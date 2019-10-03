# Pproject Tutorial
## MongoDB Atlas
#### Import backup
mongoimport --uri "mongodb+srv://ppsiteadmin:password@cluster0-olrgl.azure.mongodb.net/pproject?retryWrites=true&w=majority" --collection discordUsers --drop --file ppdb_16092019.json

# Ruby on rails Hello World
## Install ruby on rails
#### Install Ruby on Windows
Donwload the installer from here:
`https://rubyinstaller.org/downloads/`

Install it to a preferred path, but please **don't use folder name with whitespaces in the path of i** like Program Files!
#### Install Yarn
Yarn is the package manager solution for the Ruby on Rails. It was written mostly to change the nodejs package manager, npm and the RoR accepted as a package management solution.
Download the Yarn from https://yarnpkg.com/lang/en/docs/install/#windows-stable
#### Check Ruby on Rails prerequisets
- `ruby -v`
- `sqlite3 --version`
- `yarn -v`
#### Install Ruby on Rails
`gem install rails`

Check wether the installation is successful:
`rails --version`
#### Generate the tutorial project
- Navigate to a folder where you have RW permissions
- The project will be created in a new folder with the project name. So do not necessary to create an empty folder for the new project
- Use the `rails new tutorial --api --skip-active-record` command to create the project
- In some cases the sqlite3 integration can cause an issue during the deployment.
  - In the case above use the following command, `gem install sqlite3 --platform=ruby -- --with-sqlite3-dir=<PATH>`. Where the PATH is a preferred folder
  - navigate to the newly created folder and run `bundle install` to install the necessary gem packages
#### Start the Hello World API
You can start your first RoR web server with the following command:
`rails server`
Then open the http://localhost:3000/ in your browser, and voila, you have the Hello page of the project.

## Connect to MongoDB
#### Why MongoDB?
I've chosen the MongoDB as a database, because it is not a normal SQL server, it has an API that you need to integrate, before the usage of the DB. This will emulate an integration step much more better, than a normal SQL connection, and demonstrate, how can we both call a 3rd party API, and use a DB.
#### MongoDB integration pre-requisites
- Open the tutorial project folder with your favourite code editor
- Open the Gemfile from the root
- Add the followings to the gem file, to before the develpment, and test groups:
  - `gem 'mongoid', github: 'mongodb/mongoid'` => We install this from git, because it was moved from the original developer to the MongoDB authority
  - `gem 'bson_ext'`
- Run `bundle install` from the terminal/command line
#### MongoDB Compass (Optional)
The Compass is a remote monitoring tool for the MongoDB databases and clusters
- Donwload the latest version from [here](https://docs.mongodb.com/compass/master/install/)
- Install the Compass
- Connect to the test cluster: `Cluster0-shard-0/cluster0-shard-00-00-olrgl.azure.mongodb.net:27017,cluster0-shard-00-01-olrgl.azure.mongodb.net:27017,cluster0-shard-00-02-olrgl.azure.mongodb.net:27017`
- Review the content
#### MongoDB Config YAML
Create a copy about the default.mongoid.yml in the `/app/project` folder, and name it to mongoid.yml
Edit your brand new mongoid.yml file:
```
database: tutorial_<tutorial_id>
hosts:
        - Cluster0-shard-0/cluster0-shard-00-00-olrgl.azure.mongodb.net:27017
        - cluster0-shard-00-01-olrgl.azure.mongodb.net:27017
        - cluster0-shard-00-02-olrgl.azure.mongodb.net:27017
user: <tutorial_id>
password: '<tutorial_id>Pass'
roles:
        - '<tutorial_id>TutorialUser'
```
**IMPORTANT!** The mongoid.yml is untracked with git. Please **DO NOT MODIFY** the .gitignore file, and push the mongoid.yml file ever!
If you'd like to create a brand new mongoid config file, run `rails g mongoid:config` from the terminal.
#### Seed the MongoDB collection
The mongodb is a NoSQL, so don't have any server schema structure. When you send documents to the server, if there is no collection for the documents, these will be created. We will use this information to seed our DB.
Please check the content of the `db/seed.rb` file. This is a common seed file. You can use any available models to seed the db. The new collection name will be the class name with lowercase, and an 's' character on the end. So in our case the `Meeting` class in `app/models/meeting.rb` will generate a `meetings` collection.
To seed the server you need to run the `rake db:seed` task.
## Coding in Ruby
#### Create first view
Run the following command from the terminal:
`rails generate scaffold Todo title description finished:boolean`

Check what's happened in the file structure:
  - `app/assets/stylesheets`: new scss files
  - `app/controllers`: new controller named `todos_controller.rb`
  - `app/models`: new Todo model class
  - `test/controllers`: test file for the new controller
  - `test/models`: new model template
  - `test/system`: the test main script

With these you can check the structure of a full form application written by rails.
Open the http://localhost:3000/todos in a browser.

In the `public` folder you can find the basic application describers, and JS files generated once in case of every app.

Good luck with the learning of Ruby, I hope this tutorial helped you to create a development environment for your self-learning.