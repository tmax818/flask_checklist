# README.md

- [ ] create a sample [database](db/checklist.sql) to work with your sample app.

- [x] create directory

- [ ] create the virtual environment:

```
pipenv install flask pymysql flask-bcrypt
```
- [ ] activate the virtual environment:

```
pipenv shell
```
- [ ] create [server.py](server.py)

- [ ] create database connection with [mysqlconnection.py](flask_app/config/mysqlconnection.py) 



- [ ] create [`__init__.py`](./flask_app/__init__.py) 

### Models

- [ ] add a [models](flask_app/models/model.py) directory with the following content:



### Templates(aka Views)

#### Index

- [ ] create a [templates](flask_app/templates/index.html) directory with an `index.html` file as follows:



#### Models (show all models)

- [ ] add [models.html](flask_app/templates/models.html):


#### New (create a model)

  - [ ] add [new_model.html](flask_app/templates/new_model.html):



#### Edit (edit a model)

  - [ ] add [edit_model.html](flask_app/templates/edit_model.html):



#### Show (show an individual model)

- [ ] add [show_model.html](flask_app/templates/show_model.html):


### Controllers

- [ ] add a [controllers](flask_app/controllers/models.py) directory:


### Static files

- [ ] add [static](flask_app/static) directory. File structure should look like this:

![](flask_app/static/images/static-file.png)

## Start the server

```
python server.py
```
 - [ ] visit [localhost:5000](http://localhost:5000/)

# Registration and Login

- [ ] install bcrypt:


- [ ] add a [users.py](flask_app/controllers/users.py) controller with the following content:






