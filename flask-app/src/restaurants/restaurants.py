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
    cursor.execute('select rest_name, info, opening_hour, closing_hour from Restaurant')

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

# Get all the menu items given a restaurantID
# this is our 2nd route
@restaurants.route('/restaurants/<rest_id>', methods=['GET'])
def get_restaurant_menuItems(rest_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('select mi.item_name, mi.item_description, mi.price, mi.availability FROM MenuItem mi join Menu m on m.menu_id = mi.menu_id where m.rest_id={0}'.format(rest_id))    

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

# Get all the the orders for a given restaurant
# this is our 3rd route
@restaurants.route('/restaurants/orders/<rest_id>', methods=['GET'])
def get_restaurant_getAllRestOrders(rest_id):
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

# # get the top 5 products from the database
# @restaurants.route('/top5products')
# def get_most_pop_products():
#     cursor = db.get_db().cursor()
#     query = '''
#         SELECT p.productCode, productName, sum(quantityOrdered) as totalOrders
#         FROM products p JOIN orderdetails od on p.productCode = od.productCode
#         GROUP BY p.productCode, productName
#         ORDER BY totalOrders DESC
#         LIMIT 5;
#     '''
#     cursor.execute(query)
#        # grab the column headers from the returned data
#     column_headers = [x[0] for x in cursor.description]

#     # create an empty dictionary object to use in 
#     # putting column headers together with data
#     json_data = []

#     # fetch all the data from the cursor
#     theData = cursor.fetchall()

#     # for each of the rows, zip the data elements together with
#     # the column headers. 
#     for row in theData:
#         json_data.append(dict(zip(column_headers, row)))

#     return jsonify(json_data)