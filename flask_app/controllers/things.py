from flask import render_template, request, redirect, session
from flask_app import app
from flask_app.models.thing import Thing

# ! ////// CREATE  //////
# TODO CREATE REQUIRES TWO ROUTES:
# TODO ONE TO DISPLAY THE FORM:
@app.route('/thing/new')
def new_thing():
    return render_template("new_thing.html")

# TODO ONE TO HANDLE THE DATA FROM THE FORM
@app.route('/thing/create',methods=['POST'])
def create_thing():
    print(request.form)
    Thing.save(request.form)
    return redirect('/things')

# TODO READ ALL
@app.route('/things')
def things():
    if 'user_id' not in session:
        return redirect('/logout')
    return render_template("things.html",things=Thing.get_all_with_user())

# TODO READ ONE
@app.route('/thing/show/<int:id>')
def show_things(id):
    data ={ 
        "id":id
    }
    return render_template("show_thing.html",thing=Thing.get_one_with_user(data))

# ! ///// UPDATE /////
# TODO UPDATE REQUIRES TWO ROUTES
# TODO ONE TO SHOW THE FORM
@app.route('/thing/edit/<int:id>')
def edit_thing(id):
    data ={ 
        "id":id
    }
    return render_template("edit_thing.html",thing=Thing.get_one(data))

# TODO ONE TO HANDLE THE DATA FROM THE FORM
@app.route('/thing/update',methods=['POST'])
def update_thing():
    Thing.update(request.form)
    return redirect('/things')

# ! ///// DELETE //////
@app.route('/thing/destroy/<int:id>')
def destroy_thing(id):
    data ={
        'id': id
    }
    Thing.destroy(data)
    return redirect('/things')