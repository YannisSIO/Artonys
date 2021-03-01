import flask
from flask import request, jsonify, abort, make_response
import mysql.connector

app = flask.Flask(__name__)


#--DATABASE FUNCTIONS------------------------

db_info = {"name":"gestion_client","host":"db_gestion_client","user":"root","password":"password"}

#connect to database and return cursor and connection
def connect_db ():
    conn = mysql.connector.connect(host = db_info['host'], user = db_info['user'], password = db_info['password'], database = db_info['name'])
    cursor = conn.cursor()
    return cursor,conn

#disconnect from database
def disconnect_db (conection) :
    conection.close()
    

#--API--------------------------------------

#return client with name / surname given
@app.route('/api/gestion_client/getClientFromName',methods=['GET'])
def getClientFromName():
    firstname = request.args['firstname']
    surname = request.args['surname']
    if(firstname == "" or surname == ""):
        abort(400)
    
    connection = connect_db()
    connection[0].execute("select * from client where nom='" + str(surname) + "' and prenom='" + str(firstname) + "'")
    
    tmp = ""
    rows = connection[0].fetchall()
    for row in rows:
        tmp = {"id": row[0],
                "firstname": row[1],
                "surname": row[2],
                "address": row[3],
                "town": row[4],
                "sex": row[5],
                "email": row[6]}
        
    if(tmp == ""):
        abort(404)
    
    disconnect_db(connection[1])
    return jsonify(tmp)
    


#create new client
@app.route('/api/gestion_client/postCreateClient',methods=['GET', 'POST'])
def postCreateClient():
    if request.method == 'POST':
        firstname = request.form['firstname']
        surname = request.form['surname']
        address = request.form['address']
        town = request.form['town']
        sex = request.form['sex']
        email = request.form['email']
    else:
        firstname = request.args.get('firstname')
        surname = request.args.get('surname')
        address = request.args.get('address')
        town = request.args.get('town')
        sex = request.args.get('sex')
        email = request.args.get('email')
    
    if(firstname == "" or surname == "" or address == "" or town == "" or sex == "" or email == ""):
        abort(400)
    
    connection = connect_db()
    connection[0].execute("INSERT INTO client(nom, prenom, adresse, ville, sexe, email) VALUES ('" + str(surname) + "','" + str(firstname) + "','" + str(address) + "','" + str(town) + "','" + str(sex) + "','" + str(email) + "')")
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "Client created"}),200)
    

#update client info
@app.route('/api/gestion_client/postUpdateClient',methods=['POST'])
def postUpdateClient():
    firstname = request.form.get('firstname')
    surname = request.form.get('surname')
    address = request.form.get('address')
    town = request.form.get('town')
    sex = request.form.get('sex')
    email = request.form.get('email')
    identifiant = request.form.get('identifiant')
    
    if(firstname == "" or surname == "" or address == "" or town == "" or sex == "" or email == "" or identifiant == "" or identifiant.isnumeric() == False):
        abort(400)
    
    connection = connect_db()
    connection[0].execute("UPDATE client SET nom='" + str(surname) + "', prenom='" + str(firstname) + "', adresse='" + str(address) + "', ville='" + str(town) + "', sexe='" + str(sex) + "', email='" + str(email) + "' where id='" + str(identifiant) + "'")
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "Client updated"}),200) 



#delete client from id
@app.route('/api/gestion_client/deleteClient',methods=['GET'])
def deleteClient():
    identifiant = request.args['identifiant']
    
    if(identifiant == "" or identifiant.isnumeric() == False):
        abort(400)
    
    connection = connect_db()
    connection[0].execute("DELETE FROM client WHERE id='" + str(identifiant) + "'")
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "Client deleted"}),200)



#return all client of DB
@app.route('/api/gestion_client/getAllClient',methods=['GET'])
def getAllClient():
    connection = connect_db()
    
    connection[0].execute("SELECT * FROM client")
    rows = connection[0].fetchall()
    data = []
    for row in rows :
        tmp = {"id": row[0],
                "firstname": row[1],
                "surname": row[2],
                "address": row[3],
                "town": row[4],
                "sex": row[5],
                "email": row[6]}
        data.append(tmp)
    disconnect_db(connection[1])
    
    if(data == []):
        abort(404)
    
    return jsonify(data)





#--TEST-------------------------------

#html form to test /postCreateClient
@app.route('/test/postCreateClient',methods=['GET', 'POST'])
def postCreateClientTest():
    return '''<form method='POST' action='/api/gestion_client/postCreateClient'>
                <div>firstname <input name='firstname' type='text'/> </div>
                <div> surname <input name='surname' type='text'/> </div>
                <div> address <input name='address' type='text'/> </div>
                <div> town <input name='town' type='text'/> </div>
                <div> email <input name='email' type='text'/> </div>
                <div> Sex <select name='sex'><option value='1'>M</option> <option value='0'>F</option> </select></div>
                <div> <input type='submit' value='valider'/> </div>
               </form>'''


#html form to test /postUpdateClient
@app.route('/test/postUpdateClient',methods=['GET'])
def postUpdateClientTest():
    return '''<form method='POST' action='/api/gestion_client/postUpdateClient'>
                <div>identifiant <input name='identifiant' type='text'/> </div>
                <div>firstname <input name='firstname' type='text'/> </div>
                <div> surname <input name='surname' type='text'/> </div>
                <div> address <input name='address' type='text'/> </div>
                <div> town <input name='town' type='text'/> </div>
                <div> email <input name='email' type='text'/> </div>
                <div> Sex <select name='sex'><option value='1'>M</option> <option value='0'>F</option> </select></div>
                <div> <input type='submit' value='valider'/> </div>
               </form>'''




app.run(host='0.0.0.0',port=5002)








































