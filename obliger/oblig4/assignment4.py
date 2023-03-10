from flask import Flask, jsonify
from decimal import Decimal
import json
import pymysql.cursors
import datetime

# Define a custom JSON encoder that converts Decimal types to a string representation
class CustomJSONEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return str(obj)
        elif isinstance(obj, datetime.date):
            return obj.isoformat()
        return super().default(obj)

# Task 1 - Retrieve the customers who are living in “Trondheim”
@app.route('/customers_trondheim')
def get_customer_trd():
    with connection.cursor() as cursor:
        
        sql = "SELECT Name, City FROM customer WHERE City LIKE 'Trondheim'"
        customer_trondheim = cursor.execute(sql)

        if customer_trondheim >0:
            customer_trondheim = cursor.fetchall()
            cursor.close()
            
            response = jsonify(customer_trondheim), 200
            return response
        else: return jsonify("Nothing found!"), 404

# Database configuration
config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'db': 'assignment4',
    'charset': 'utf8mb4',
    'cursorclass': pymysql.cursors.DictCursor
}

# Create a connection object
connection = pymysql.connect(**config)

# Create a Flask app object
app = Flask(__name__)
app.json_encoder = CustomJSONEncoder

# Define an endpoint to retrieve all data from a specific table
@app.route('/order_items')
def get_customer_data():
    with connection.cursor() as cursor:
        # Execute the SQL query to retrieve all data from the table
        sql = "SELECT Name, City FROM customer WHERE City LIKE 'Trondheim'"
        customer_trondheim=cursor.execute(sql)

        if customer_trondheim = cursor.execute(sql)
            customer_trondheim = cursor.

        # Fetch all the rows of data
        data = cursor.fetchall()

        # Convert the data to a JSON format
        response = jsonify(data)

    # Return the JSON response
    return response

# Task 1 - Retrieve the customers who are living in “Trondheim”@app.route('/customers_trondheim')def get_customer_trd():    with connection.cursor() as cursor:        sql = "SELECT Name, City FROM customer WHERE City LIKE 'Trondheim'"        customer_trd = cursor.execute(sql)        if customer_trd >0:            customer_trd = cursor.fetchall()            cursor.close()            response = jsonify(customer_trd), 200            return response            else: return jsonify("Nothing found!"), 404

if __name__ == '__main__':
    app.run(debug=True, port=3333)

