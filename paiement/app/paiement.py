import flask
from flask import request, jsonify, abort, make_response
import mysql.connector

app = flask.Flask(__name__)


#--DATABASE FUNCTIONS------------------------

db_info = {"name":"paiement","host":"db_paiement","user":"root","password":"password"}

#connect to database and return cursor and connection
def connect_db ():
    conn = mysql.connector.connect(host = db_info['host'], user = db_info['user'], password = db_info['password'], database = db_info['name'])
    cursor = conn.cursor()
    return cursor,conn

#disconnect from database
def disconnect_db (conection) :
    conection.close()
    

#create new credit card
@app.route('/api/paiement/postCreateCard',methods=['POST'])
def postCreateCard():
    clientId = request.form.get('clientId')
    cardNumber = request.form.get('cardNumber')
    expirationDate = request.form.get('expirationDate')
    csvNumber = request.form.get('csvNumber')
    
    if(cardNumber == "" or expirationDate == "" or csvNumber == "" or clientId == ""):
        abort(400)
    
    connection = connect_db()
    connection[0].execute("INSERT INTO creditcard(clientId, cardNumber, expirationDate, csvNumber) VALUES ('" + str(clientId) + "','" + str(cardNumber) + "','" + str(expirationDate) + "','" + str(csvNumber) + "')")
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "card created"}),200)

#return card for given client id
@app.route('/api/paiement/getCardFromClientId',methods=['GET'])
def getCardFromClientId():
    clientId = request.args['clientId']
    if(clientId == "" or clientId.isnumeric() == False):
        abort(400)
    
    connection = connect_db()
    connection[0].execute("select * from creditcard where clientId='" + str(clientId) + "'")
    
    tmp = ""
    rows = connection[0].fetchall()
    for row in rows:
        tmp = {"id": row[0],
                "clientId": row[1],
                "cardNumber": row[2],
                "expirationDate": row[3],
                "csvNumber": row[4]}
        
    if(tmp == ""):
        abort(404)
    
    disconnect_db(connection[1])
    return jsonify(tmp)
    




#--TEST-------------------------------

#html form to test /postCreateClient
@app.route('/test/postCreateCard',methods=['GET'])
def postCreateCardTest():
    return '''<form method='POST' action='/api/paiement/postCreateCard'>
                <div>clientId <input name='clientId' type='text'/> </div>
                <div> cardNumber <input name='cardNumber' type='text'/> </div>
                <div> expirationDate <input name='expirationDate' type='text'/> </div>
                <div> csvNumber <input name='csvNumber' type='text'/> </div>
                <div> <input type='submit' value='valider'/> </div>
               </form>'''



app.run(host='0.0.0.0',port=5004)