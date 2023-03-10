from flask import Flask, jsonify
from decimal import Decimal
import json
import pymysql.cursors

# Define a custom JSON encoder that converts Decimal types to a string representation
class CustomJSONEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return str(obj)
        return super().default(obj)



# Database configuration
config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'db': 'cars',
    'charset': 'utf8mb4',
    'cursorclass': pymysql.cursors.DictCursor
}

# Create a connection object
connection = pymysql.connect(**config)

# Create a Flask app object
app = Flask(__name__)
app.json_encoder = CustomJSONEncoder

@app.route('/')
def index():
    return "hello"

@app.route('/getCars')
def getCars():
    with connection.cursor() as cursor:
        query = "SELECT * from car"
        cursor.execute(query)
        data = cursor.fetchall()
        response = jsonify(data)
    return response
# Define an endpoint to retrieve all data from a specific table


if __name__ == '__main__':
    app.run(debug=True, port=3333)

