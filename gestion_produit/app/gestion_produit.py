from flask import request, jsonify, abort, make_response, Flask
import mysql.connector

app = Flask(__name__)

db_name = "gestion_produit"
db_host = "db_gestion_produit"
db_user = "root"
db_password = "password"


#--DATABASE FUNCTIONS------------------------

#connect to database and return cursor and connection
def connect_db ():
    conn = mysql.connector.connect(host = db_host, user = db_user, password = db_password, database = db_name)
    cursor = conn.cursor()
    return cursor,conn

#disconnect from database
def disconnect_db (conection) :
    conection.close()





#--API PAGES--------------------------------

#return all products with "name" in column nom of table produit
@app.route('/api/gestion_produit/getProductByName',methods=['GET'])
def getProductByName():
    name = request.args['name']
    if(name == ""):
        abort(400)

    connection = connect_db()
    
    connection[0].execute("select * from produit where nom LIKE '%" + str(name) + "%'")
    
    data = []
    rows = connection[0].fetchall()
    for row in rows :
        tmp = {"id": row[0],
                "nom": row[1],
                "description": row[2],
                "prix": row[3],
                "image": row[4],
                "categorie": row[5]}
        data.append(tmp)
    
    if(data == []):
        abort(404)
    
    disconnect_db(connection[1])
    return jsonify(data)


#return all columns from product table with id=identifiant
@app.route('/api/gestion_produit/getProductById',methods=['GET'])
def getProductById():
    identifiant = request.args['identifiant']
    if(identifiant == "" or identifiant.isnumeric() == False):
        abort(400)

    connection = connect_db()
    
    connection[0].execute("select * from produit where id = " + str(identifiant))
    
    tmp = ""
    rows = connection[0].fetchall()
    for row in rows:
        tmp = {"id": row[0],
                    "nom": row[1],
                    "description": row[2],
                    "prix": row[3],
                    "image": row[4],
                    "categorie": row[5]}
    
    if(tmp == ""):
        abort(404)
    
    disconnect_db(connection[1])
    return jsonify(tmp)


#return category corresponding to identifiant
@app.route('/api/gestion_produit/getCategoryById',methods=['GET'])
def getCategoryById():
    identifiant = request.args['identifiant']
    if(identifiant == "" or identifiant.isnumeric() == False):
        abort(400)

    connection = connect_db()
    
    tmp = ""
    connection[0].execute("select nom from categorie where id=" + str(identifiant))
    rows = connection[0].fetchall()
    for row in rows:
        tmp = {"id": identifiant,
                "description": row[0]}
    
    if(tmp == ""):
        abort(404)
                
    disconnect_db(connection[1])
    return jsonify(tmp)


#return all products associated with a category ID
@app.route('/api/gestion_produit/getProductByCategory',methods=['GET'])
def getProductByCategory():
    category = request.args['category']
    if(category == "" or category.isnumeric() == False):
        abort(400)
    
    connection = connect_db()
    
    connection[0].execute("SELECT * FROM produit WHERE id_categorie = " + str(category))
    rows = connection[0].fetchall()
    data = []
    for row in rows :
        tmp = {"id": row[0],
                "nom": row[1],
                "description": row[2],
                "prix": row[3],
                "image": row[4],
                "categorie": row[5]}
        data.append(tmp)
        
    disconnect_db(connection[1])
    
    if(data == []):
        abort(404)
    
    return jsonify(data)


#return all categories
@app.route('/api/gestion_produit/getAllCategories',methods=['GET'])
def getAllCategories():
    connection = connect_db()
    
    connection[0].execute("SELECT * FROM categorie")
    rows = connection[0].fetchall()
    data = []
    for row in rows :
        tmp = {"id":row[0],
                "nom": row[1]}
        data.append(tmp)
    disconnect_db(connection[1])
    return jsonify(data)


#return all products
@app.route('/api/gestion_produit/getAllProducts',methods=['GET'])
def getAllProducts():
    connection = connect_db()
    
    connection[0].execute("SELECT * FROM produit")
    rows = connection[0].fetchall()
    data = []
    for row in rows :
        tmp = {"id":row[0],
                "nom": row[1],
                "description": row[2],
                "prix": row[3],
                "image": row[4],
                "categoryId": row[1]}
        data.append(tmp)
    disconnect_db(connection[1])
    return jsonify(data)


#delete product given (by id)
@app.route('/api/gestion_produit/deleteProduct',methods=['GET'])
def deleteProduct():
    identifiant = request.args['identifiant']
    if(identifiant == "" or identifiant.isnumeric() == False):
        abort(400)
    
    connection = connect_db()
    
    #check if product exists, if not : returns 404
    connection[0].execute("select * FROM produit WHERE id = " + str(identifiant))
    rows = connection[0].fetchall()
    if (rows == []):
        abort(404)
        
    connection[0].execute("DELETE FROM produit WHERE id = " + str(identifiant))
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "Product deleted"}),200)
    

#delete category given (by id)
@app.route('/api/gestion_produit/deleteCategory',methods=['GET'])
def deleteCategory():
    identifiant = request.args['identifiant']
    if(identifiant == "" or identifiant.isnumeric() == False):
        abort(400)
    
    connection = connect_db()
    
    #check if category exists, if not : returns 404
    connection[0].execute("select * FROM categorie WHERE id = " + str(identifiant))
    rows = connection[0].fetchall()
    if (rows == []):
        abort(404)
    
    connection[0].execute("DELETE FROM categorie WHERE id = " + str(identifiant))
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "Category deleted"}),200)
    
    
#create new product from HTML Form with name, description, price, image, categoryId  
@app.route('/api/gestion_produit/postProduct',methods=['POST'])
def postProduct():
    name = request.form.get('name')
    description = request.form.get('description') #optional
    price = request.form.get('price')
    image = request.form.get('image') #optional
    categoryId = request.form.get('categoryId')
    
    if(name == "" or price == "" or categoryId == "" or categoryId.isnumeric() == False):
        abort(400)
    
    try:
        float(price)
    except ValueError:
        abort(400)
    
    connection = connect_db()
    connection[0].execute("INSERT INTO produit(nom, description, prix, image, id_categorie) VALUES ('" + name + "','" + description + "'," + price + ",'" + image + "'," + categoryId + ")")
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "Product created"}),200)



#create new Category from HTMLM Form with name
@app.route('/api/gestion_produit/postCategory',methods=['POST'])
def postCategory():
    name = request.form.get('name')
    
    if(name == ""):
        abort(400)
    
    connection = connect_db()
    connection[0].execute("INSERT INTO categorie(nom) VALUES ('" + name + "')")
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "Category created"}),200)





#--TEST-------------------------------

#html form to test /postProduct
@app.route('/test/postProduct',methods=['GET'])
def postProductTest():
    return '''<form method='POST' action='/api/gestion_produit/postProduct'>
                <div>name <input name='name' type='text'/> </div>
                <div> description <input name='description' type='text'/> </div>
                <div> price <input name='price' type='text'/> </div>
                <div> image <input name='image' type='text'/> </div>
                <div> categoryId <input name='categoryId' type='text'/> </div>
                <div> <input type='submit' value='valider'/> </div>
               </form>'''


#html form to test /postCategory
@app.route('/test/postCategory',methods=['GET'])
def postCategoryTest():
    return '''<form method='POST' action='/api/gestion_produit/postCategory'>
                <div>name <input name='name' type='text'/> </div>
                <div> <input type='submit' value='valider'/> </div>
               </form>'''



app.run(host='0.0.0.0',port=5000)




















