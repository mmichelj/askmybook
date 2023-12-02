# Ask Sherlock Holmes

An _[askmybook](https://github.com/slavingia/askmybook)_ clone built with Rails, React and [esbuild](https://esbuild.github.io/). 

Ask anything about the contents of _The Adventures of Sherlock Holmes_ by Sir Arthur Conan Doyle. Some sample quiz questions are available in the resources below:

[The Adventures of Sherlock Holmes trivia questions](https://www.funtrivia.com/trivia-quiz/Literature/)

[The Adventures of Sherlock Holmes Quiz](https://bookroo.com/book-quiz/the-adventures-of-sherlock-holmes)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

#### NodeJS and npm

Make sure to have [nodejs and npm installed](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) in your local system. This application was built with node v16.14.0 and npm v8.3.1.

#### Yarn

Follow the instructions in the [official website](https://classic.yarnpkg.com/en/docs/install#debian-stable). This project uses v1.22.21.

#### Ruby / Ruby on Rails

[Install Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [Ruby on Rails](https://guides.rubyonrails.org/v5.0/getting_started.html#installing-rails). This application was built with Ruby v3.1.2 and Rails v7.0.8.

#### Postgres

This application requires a [postgresql v15+ installed](https://www.postgresql.org/download/) in your local machine.

Additionally, the [pgvector extension](https://www.postgresql.org/download/) must be installed.

```sh
cd /tmp
git clone --branch v0.5.1 https://github.com/pgvector/pgvector.git
cd pgvector
make
make install # may need sudo
```

### Installation

A step by step series of examples that tell you how to get a development env running.

#### Step 1. Clone the repo and cd to the root directory

```sh
git clone https://github.com/mmichelj/askmybook.git
```
```sh
cd askmybook
```

#### Step 2. Install the dependencies

```
bundle install
```

#### Step 3. Generate embeddings from your PDF book

You will use the pdf_to_csv_embeddings.rb script to generate your embeddings.

Run the script passing the name of your pdf file and your OpenAI key as arguments

```sh
ruby app/assets/scripts/pdf_to_csv_embeddings.rb -p /path/to/your/pdf/book.pdf -k sk-OpenAIKey
```
Move the generated embeddings to your public path
```sh
sudo mv -f pdf_embeddings.csv /public
```
#### Step 4. Defining secrets

Add your OpenAI key and DB user/password as a Rails secrets by modifying credentials.yml.enc

```sh
# Change 'code' to your preferred text editor
EDITOR="code --wait" bin/rails credentials:edit
```

Sample:

```yml
OPENAI_API_KEY: sk-MyOpenAiKey
ASKMYBOOK_DATABASE_USER: username
ASKMYBOOK_DATABASE_PASSWORD: password
ASKMYBOOK_PROD_DATABASE_USER: produser
ASKMYBOOK_PROD_DATABASE_PASSWORD: prodpassword
``` 

#### Step 5. Database setup

If you have not done it, install postgres

```sh
sudo apt install postgresql-15 postgresql-contrib libpq-dev
```

Create a new role

```sh
sudo -u postgres createuser -s book -P
```

Run the creation scripts
```sh
rails db:create
```

Run the migrations
```sh
rake db:migrate
```

Seed the tables
```sh
rake db:seed
```

#### Step 6. Run the dev environment

```sh
rails assets:precompile
```

```sh
bin/dev
```

## Deployment

This application is hosted in heroku. To deploy it you will need to create a new application with a standard postgres database.

Create heroku app
```sh
heroku apps:create
```

Add a postgres db
```sh
heroku addons:create heroku-postgresql:standard-0 -a example-app --block-logs
```

Create the user and password for the application using the heroku app management.

Deploy the application
```sh
git push heroku main
```

Migrate the db

```sh
heroku run rake db:migrate
```

You will have to manually seed the tables in the database using pgAdmin as heroku currently does not provide admin privileges on its databases. You can do this by exporting the initial db data from your local env and importing it in the newly created tables.

Additonal information is available in the [heroku website](https://devcenter.heroku.com/articles/getting-started-with-rails7).

## Built With

* Ruby v3.1.2 
* Rails v7.0.8.
* node v16.14.0 
* npm v8.3.1
* yarn v1.22.21.

## Technical Design



## Acknowledgments

* Readme template taken from [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* OpenAI api [documentation](https://platform.openai.com/docs/api-reference)
* pgvector [documentation](https://github.com/pgvector/pgvector)
* neighbors [documentation](https://github.com/ankane/neighbor)