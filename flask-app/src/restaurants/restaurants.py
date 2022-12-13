from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


restaurants = Blueprint('restaurants', __name__)

# Get all the restaurants from the database
# this is our first route
@restaurants.route('/restaurants', methods=['GET'])
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

# Get all the orders for a given restaurant
# this is our 3rd route
@restaurants.route('/restaurants/orders/<rest_id>', methods=['GET'])
def get_all_restaurant_orders(rest_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('select * FROM FoodOrder fo where fo.rest_id={0}'.format(rest_id))

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


# add a new menu item to a menu of a specific restaurant
# this is our 4th route
@restaurants.route('/restaurants/addMenuItem', methods=['POST'])
def addNewMenuItem():
    
    current_app.logger.info(request.form);
    cursor = db.get_db().cursor();
    menu_id = request.form['menu_id']
    food_category_id = request.form['food_category_id']
    name = request.form['name']
    description = request.form['description']
    price = request.form['price']

    query = f'INSERT INTO MenuItem (menu_id, food_category_id, item_name, item_description, price, item_availability) VALUES ({menu_id}, {food_category_id}, "{name}", "{description}", {price}, true)'
    current_app.logger.info(query);

    cursor.execute(query)
    db.get_db().commit()
    return 'Success!'
