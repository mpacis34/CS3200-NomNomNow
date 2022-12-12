from flask import Blueprint, request, jsonify, make_response
import json
from src import db


drivers = Blueprint('drivers', __name__)

# Get all drivers from the DB
@drivers.route('/drivers', methods=['GET'])
def get_customers():
    cursor = db.get_db().cursor()
    cursor.execute('select * from DeliveryDriver')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all available food orders and decide which one to pick
# this is our fifth route
@drivers.route('/orders/<driver_id>', methods=['GET'])
def get_completed_orders(driver_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('select r.rest_name, r.country, r.rest_state, r.city, r.street, r.zip, fo.order_id from FoodOrder fo join Restaurant r on fo.rest_id = r.rest_id where fo.driver_id={0}'.format(driver_id))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# access the specific customer information when you are in the process of delivering
# this is our sixth route
@drivers.route('/orderDelivery/<order_id>', methods=['GET'])
def get_customer_info_for_order(order_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('select cust.first_name, cust.last_name, cd.delivery_street, cd.delivery_city, \
        cd.delivery_zip, cd.delivery_state, cd.delivery_country, cd.order_id from CustomerDriver \
            cd join Customer cust on cd.customer_id = cust.customer_id join FoodOrder fo on cd.order_id = \
                fo.order_id  where cd.order_id={0}'.format(order_id))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)