import flask
from flask import request, jsonify, abort, make_response
import mysql.connector

app = flask.Flask(__name__)


#--DATABASE FUNCTIONS------------------------

db_info = {"name":"authentification","host":"auth_db","user":"root","password":""}

#connect to database and return cursor and connection
def connect_db ():
    conn = mysql.connector.connect(host = db_info['host'], user = db_info['user'], password = db_info['password'], database = db_info['name'])
    cursor = conn.cursor()
    return cursor,conn

#disconnect from database
def disconnect_db (conection) :
    conection.close()




#--API PAGES--------------------------------

#create user credentials
@app.route('/api/authentification/postCreateCredential',methods=['POST'])
def postCreateUser():
    login = request.form.get('login')
    password = request.form.get('password')
    clientId = request.form.get('clientId')
    
    if(login == "" or password == "" or clientId == "" or clientId.isnumeric() == False):
        abort(400)
    
    connection = connect_db()
    connection[0].execute("INSERT INTO client(clientId, login, password) VALUES ('" + str(clientId) + "','" + str(login) + "','" + str(password) + "')")
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "credentials created"}),200)
    

#get password and login and id for a clientId given
@app.route('/api/authentification/getUserCredential',methods=['GET'])
def getUserCredential():
    clientId = request.args['clientId']
    
    if(clientId == "" or clientId.isnumeric() == False):
        abort(400)
    
    connection = connect_db()
    tmp = ""
    connection[0].execute("SELECT login, password, id FROM client WHERE clientId =" + str(clientId))
    rows = connection[0].fetchall()
    for row in rows:
        tmp = {"login": row[0],
                "password": row[1],
                "id": row[2]}
    
    if(tmp == ""):
        abort(404)
                
    disconnect_db(connection[1])
    return jsonify(tmp)
    
    
#delete credential for id given
@app.route('/api/authentification/deleteUserCredential', methods=['GET'])
def deleteUserCredential():
    identifiant = request.args['identifiant']
    
    if(identifiant == "" or identifiant.isnumeric() == False):
        abort(400)
        
    connection = connect_db()
    connection[0].execute("DELETE from client WHERE id=" + str(identifiant))
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "credentials deleted"}),200)
    

#update user password for a given clientId
@app.route('/api/authentification/postChangePassword', methods=['POST'])
def postChangePassword():
    password = request.form.get('password')
    clientId = request.form.get('clientId')
    
    if(password == "" or clientId == "" or clientId.isnumeric() == False):
        abort(400)
    
    connection = connect_db()
    connection[0].execute("UPDATE client SET password = '" + str(password) + "' WHERE clientId='" + str(clientId) + "'")
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "credentials updated"}),200)



#return client ID for given password / Login
@app.route('/api/authentification/authentificate', methods=['GET', 'POST'])
def authentificate():
    if request.method == 'POST':
        login = request.form['login']
        password = request.form['password']
    else:
        login = request.args.get('login')
        password = request.args.get('password')
        
    if(password == "" or login == ""):
        abort(400)
    
    connection = connect_db()
    tmp = ""
    connection[0].execute("SELECT clientId from client where login='" + str(login) + "' and password='" + str(password) + "'")  
    print("SELECT clientId from client where login='" + str(login) + "' and password='" + str(password) + "'")
    rows = connection[0].fetchall()
    for row in rows:
        tmp = {"clientId": row[0]}
        print(row)
    
    if(tmp == ""):
        abort(404)
                
    disconnect_db(connection[1])
    return jsonify(tmp)



    
    
#--TEST-------------------------------------

#html form to test /postCreateCredential
@app.route('/test/postCreateCredential',methods=['GET'])
def postCreateCredentialTest():
    return '''<form method='POST' action='/api/authentification/postCreateCredential'>
                <div> login <input name='login' type='text'/> </div>
                <div> password <input name='password' type='text'/> </div>
                <div> clientId <input name='clientId' type='text'/> </div>
                <div> <input type='submit' value='valider'/> </div>
               </form>'''


#html form to test /postChangePassword
@app.route('/test/postChangePassword',methods=['GET'])
def postChangePasswordTest():
    return '''<form method='POST' action='/api/authentification/postChangePassword'>
                <div> password <input name='password' type='text'/> </div>
                <div> clientId <input name='clientId' type='text'/> </div>
                <div> <input type='submit' value='valider'/> </div>
               </form>'''


#html form to test /authentificate
@app.route('/test/authentificate',methods=['GET', 'POST'])
def postAuthentificateTest():
    return '''<form method='POST' action='/api/authentification/authentificate'>
                <div> password <input name='password' type='password'/> </div>
                <div> login <input name='login' type='text'/> </div>
                <div> <input type='submit' value='valider'/> </div>
               </form>'''



app.run(host='0.0.0.0',port=5001)





















