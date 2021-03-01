import flask
from flask import request, jsonify, abort, make_response
import mysql.connector

app = flask.Flask(__name__)


#--DATABASE FUNCTIONS------------------------

db_info = {"name":"historique_commande","host":"db_historique_commande","user":"root","password":"password"}

#connect to database and return cursor and connection
def connect_db ():
    conn = mysql.connector.connect(host = db_info['host'], user = db_info['user'], password = db_info['password'], database = db_info['name'])
    cursor = conn.cursor()
    return cursor,conn

#disconnect from database
def disconnect_db (conection) :
    conection.close()




#--API PAGES--------------------------------

#create a new order
@app.route('/api/historiqueCommande/postOrder',methods=['POST'])
def postOrder():
    clientId = request.form.get('clientId')
    dateOfOrder = request.form.get('dateOfOrder') #optional
    
    if(clientId == "" or clientId.isnumeric() == False):
        abort(400)
    
    connection = connect_db()
    connection[0].execute("INSERT INTO commandes(id_client, date) VALUES ('" + str(clientId) + "','" + str(dateOfOrder) + "')")
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "Order created"}),200)
    
 
#add product to order (create new line in DB "detail_commande")
@app.route('/api/historiqueCommande/postOrderProduct',methods=['POST'])
def postOrderProduct():
    orderId = request.form.get('orderId')
    productId = request.form.get('productId')
    
    if(orderId == "" or productId == ""):
        abort(400)
    if(orderId.isnumeric() == False or productId.isnumeric() == False):
        abort(400)
    
    connection = connect_db()
    connection[0].execute("INSERT INTO detail_commande(produit_id, commande_id) VALUES ('" + str(productId) + "','" + str(orderId) + "')")
    
    connection[0].execute("SELECT COUNT(*) FROM detail_commande WHERE commande_id=" + str(orderId))
    rows = connection[0].fetchall()
    nbItem = rows[0][0]
    
    '''A MODIFIER'''
    totalPrice = 0
    
    connection[0].execute("UPDATE commandes SET nombre_article = '" + str(nbItem) + "', prix_total = '" + str(totalPrice) + "' WHERE id=" + str(orderId))
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "Order line created"}),200)
    

#returns all products in an order (given by id)
@app.route('/api/historiqueCommande/getOrderProduct',methods=['GET'])
def getOrderProduct():
    identifiant = request.args['identifiant']
    if(identifiant == "" or identifiant.isnumeric() == False):
        abort(400)

    connection = connect_db()
    
    connection[0].execute("select * from detail_commande where commande_id = " + str(identifiant))
    
    data = []
    rows = connection[0].fetchall()
    for row in rows:
        tmp = {"id": row[0],
                    "productId": row[1],
                    "orderID": row[2]}
        data.append(tmp)
        
    if(data == []):
        abort(404)
    
    disconnect_db(connection[1])
    return jsonify(data)
 
 
#returns order's informations (retreive by order id or client id)
@app.route('/api/historiqueCommande/getOrderInfo',methods=['GET']) 
def getOrderInfo():
    orderId = request.args['orderId']
    clientId = request.args['clientId']
    
    print(request.args['clientId'])
 
    if(orderId == ""):
        if(clientId == ""):
            abort(400)
 
    if(orderId != ""):
        if(orderId.isnumeric() == False or clientId != ""):
            abort(400)
        requete = "select * from commandes where id = " + str(orderId)
    else:
        if(clientId.isnumeric() == False or orderId != ""):
            abort(400)
        requete = "select * from commandes where id_client = " + str(clientId)
        

    connection = connect_db()
    
    connection[0].execute(requete)
    
    data = []
    rows = connection[0].fetchall()
    for row in rows:
        tmp = {"orderId": row[0],
                "clientId": row[1],
                "totalPrice": row[2],
                "totalItems": row[3],
                "date": row[4]
                }
        data.append(tmp)
        
    if(data == []):
        abort(404)
    
    disconnect_db(connection[1])
    return jsonify(data)
 
 
#delete order with given id / delete cascade all order's detail from DB table "detail_commande"
@app.route('/api/historiqueCommande/deleteOrder',methods=['GET'])
def deleteOrder():
    identifiant = request.args['identifiant']
    
    if (identifiant == "" or identifiant.isnumeric() == False):
        abort(400)
    
    connection = connect_db()
    connection[0].execute("DELETE from commandes WHERE id=" + str(identifiant))
    connection[0].execute("DELETE from detail_commande WHERE commande_id=" + str(identifiant))
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "Order deleted"}),200)
    
 
 #delete item from order (by order id and product id)
@app.route('/api/historiqueCommande/deleteOrderItem',methods=['GET'])
def deleteOrderItem():
    orderId = request.args['orderId']
    productId = request.args['productId']

    if(orderId == "" or productId == "" or orderId.isnumeric() == False or productId.isnumeric == False):
        abort(400)

    connection = connect_db()
    connection[0].execute("DELETE from detail_commande WHERE produit_id=" + str(productId) + " and commande_id=" + str(orderId))
    connection[1].commit()
    disconnect_db(connection[1])
    return make_response(jsonify({"message": "Item deleted"}),200)
 
 
 
 
 
 #--TEST-------------------------------

#html form to test /postOrder
@app.route('/test/postOrder',methods=['GET'])
def postOrderTest():
    return '''<form method='POST' action='/api/historiqueCommande/postOrder'>
                <div>client ID <input name='clientId' type='text'/> </div>
                <div> Date <input name='dateOfOrder' type='text'/> </div>
                <div> <input type='submit' value='valider'/> </div>
               </form>'''
 
 
#html form to test /postOrderProduct
@app.route('/test/postOrderProduct',methods=['GET'])
def postOrderProductTest():
    return '''<form method='POST' action='/api/historiqueCommande/postOrderProduct'>
                <div> Order ID <input name='orderId' type='text'/> </div>
                <div> Product ID <input name='productId' type='text'/> </div>
                <div> <input type='submit' value='valider'/> </div>
               </form>'''
 
 
 
  
 
    
app.run(host='0.0.0.0',port=5003)
































