from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


customers = Blueprint('customers', __name__)

# Get all customers from the DB
@customers.route('/customers', methods=['GET'])
def get_customers():
    cursor = db.get_db().cursor()
    cursor.execute('select * from Customer')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all the restaurants from the database
# this is our first route
@customers.route('/restaurants', methods=['GET'])
def get_restaurants():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('select rest_id, rest_name, info, opening_hour, closing_hour from Restaurant')

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

# Get customer detail for customer with particular userID
@customers.route('/customers/<userID>', methods=['GET'])
def get_customer(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Customer where customer_id = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
    
# Get all the menu items given a restaurantID
# this is our 2nd route
@customers.route('/restaurant_menu/<rest_id>', methods=['GET'])
def get_restaurant_menuItems(rest_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('select mi.item_name, mi.item_description, fc.food_category_name, mi.price, mi.item_availability FROM MenuItem mi join Menu m on m.menu_id = mi.menu_id join FoodCategory fc on mi.food_category_id = fc.food_category_id where m.rest_id={0}'.format(rest_id))    

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

# rate a restaurant
@customers.route('/rate_restaurant/<rest_id>', methods=['POST'])
def rateRestaurant(rest_id):
    current_app.logger.info(request.form);
    cursor = db.get_db().cursor();
    cust_id = request.form['cust_id']
    score = request.form['score']
    query = f'INSERT INTO RestaurantRating (rest_id, cust_id, score) VALUES ({rest_id}, {cust_id}, {score})'
    current_app.logger.info(query);
    cursor.execute(query)
    db.get_db().commit()
    return 'Success!'

# Get a particular restaurant's rating
@customers.route('/rest_rating/<restID>', methods=['GET'])
def get_rest_rating(restID):
    cursor = db.get_db().cursor()
    cursor.execute('select score from RestaurantRating where rest_id = {0}'.format(restID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response