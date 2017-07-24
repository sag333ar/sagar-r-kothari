### PostgresQL Installation & command line basics

#### Install brew

Run following command in terminal to install brew if it is not installed.

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

#### Update brew

Run following command to ensure you're using latest version of brew.

```
brew update
```

#### Install prerequisite

Make sure you've libxml2 library. If not, install using following command.

```
brew install libxml2
```

#### Install postgres

To install postgres using brew, use following command.

```
brew install postgres
```

#### Start postgres service

In order to start postgresql, run following command.

```
brew services start postgresql
```

#### Create PostgresQL Database User

To create user, which can access database of postgresql, run following command. 
In following case perfect is the name of the user. Provide password once prompted. 

```
createuser -D -P perfect
```

* `-D` -> user can not create databases.
* `-P` -> user will need password.

#### Create PostgresQL Database

To create database with above user, please run following command.

```
create db -O perfect perfect_testing
```

* `-O` perfect -> owner of the database = perfect.
* `perfect_testing` -> name of the database.

#### Start PostgresQL terminal

To start PostgresQL terminal, run following command.

```
psql -d perfect_testing -U perfect
```

* `-d perfect_testing` -> specified database
* `-U perfect` -> specified username.
* Use `\q` to exit from PostgresQL terminal.
* Use `\d` to show database tables.
* Use `\d tablename` to table specific information.
