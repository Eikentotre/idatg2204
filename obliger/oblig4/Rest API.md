# Rest API og Python
## Rest API
- Used to create service APIs on the web
	- Services that most often access databases
- Siz guiding principles:

## Identification of Resources
- Resources are identified by URIs:
	- For instance, the guest staying in room 303 for the customer 1's booking 212 in the hotel booking case: /customers/1/bookings/212/rooms/303/guests



### Notater
- Lowercase
- hyphens rather than underscores
- No trailing forward slash in URIs (ASK)
- No file extensions
- No CRUD function names in URIs
- Resource methods (HTTP methods): 
	- POST
	- GET
	- PUT or PATCH
	- DELETE


Import jsonify
``` json
config = {
		'host': 'localhost',
		'user': 'root',
		password: ' ',
		'db': 'cars',
		'charset': 'utf8mb4',
		'cursorclass': pymysql.cursors.Distcursors
		
}
``` 

Creating connection object
Connection = pymysql.connect (ASK)

For API you need to define route
``` json
@app.route('/')
def index():
	return "hello"

@app.route('/getCars')
def getCars():


@app.route('/order_items')
def get_table_data():
		with connection.cursor() as cursor: 
				query = "SELECT * from cars*"
				cursor.execute(query)
				data = cursor.fetchall // fetches all data from query. Have to convert data to json
				response = jsonify(data)
		return response

```




Last ned: 
- Postman
	Sends request to given URI

pip install flask
Firebase 
``` json
cred = credentials.Certificate ("")
firebase_admin.ititialize_app(cred)
db = firestone.client()

```

# Create a flask app object
# Used for handling route, and for responses and requests
```python
app = Flask(__name__)

@app.route("/post_person", methods=[post])
def get_post():
	data = request.get_json()

	name = data['name']
	age = data['age']

	doc_ref = db.collection('persons').document(name)
	doc_ref.set({
		'name':name,
		'age':age
	})
	return f("successfully posted person with {name}"
```



https://hevodata.com/learn/flask-mysql/

```python
from flask import Flask,render_template, request
from flask_mysqldb import MySQL
 
app = Flask(__name__)
 
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'flask'
 
mysql = MySQL(app)
```
