from flask_app.config.mysqlconnection import connectToMySQL
from pprint import pprint
DATABASE = 'template'

class Thing:
    def __init__(self, data:dict) -> None:
        self.id = data['id']
        self.column1 = data['column1']
        self.column2 = data['column2']
        self.column3 = data['column3']
        self.column4 = data['column4']
        self.column5 = data['column5']
        self.user_id = data['user_id']
        if 'first_name' in data:
            self.first_name = data['first_name']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']


    # ! CREATE
    @classmethod
    def save(cls, data:dict) -> int:
        query = "INSERT INTO things (column1,column2,column3,column4,column5, user_id) VALUES (%(column1)s, %(column2)s, %(column3)s, %(column4)s, %(column5)s, %(user_id)s);"
        result = connectToMySQL(DATABASE).query_db(query,data)
        return result

    # ! READ/RETRIEVE ALL
    @classmethod
    def get_all(cls) -> list:
        query = "SELECT * FROM things;"
        results = connectToMySQL(DATABASE).query_db(query)
        things = []
        for u in results:
            things.append( cls(u) )
        return things
 
    # ! READ/RETRIEVE ALL
    @classmethod
    def get_all_with_user(cls) -> list:
        query = "SELECT * FROM things JOIN users ON users.id = things.user_id;"
        results = connectToMySQL(DATABASE).query_db(query)
        pprint(results)
        things = []
        for u in results:
            things.append( cls(u) )
        return things
    
    # ! READ/RETRIEVE ONE
    @classmethod
    def get_one(cls,data:dict) -> object:
        query  = "SELECT * FROM things JOIN users ON things.user_id = users.id WHERE things.id = %(id)s;"
        result = connectToMySQL(DATABASE).query_db(query,data)
        pprint(result)
        return cls(result[0])

    # ! UPDATE
    @classmethod
    def update(cls,data:dict) -> int:
        query = "UPDATE things SET column1=%(column1)s,column2=%(column2)s,column3=%(column3)s, column4=%(column4)s, column5=%(column5)s, user_id=%(user_id)s WHERE id = %(id)s;"
        return connectToMySQL(DATABASE).query_db(query,data)

    # ! DELETE
    @classmethod
    def destroy(cls,data:dict):
        query  = "DELETE FROM things WHERE id = %(id)s;"
        return connectToMySQL(DATABASE).query_db(query,data)