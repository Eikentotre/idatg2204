from flask import Flask, jsonify
from flask_mysqldb import MySQL
app = Flask(__name__)


app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'assignment4'

mysql = MySQL(app)


@app.route('/')
def root():
    return "root"

@app.route('/trondheim')
def trondheim():
    cursor = mysql.connection.cursor()
    query = "SELECT * FROM customer WEHRE City = 'trondheim'"
    cursor.execute(query)
    response = cursor.fetchall()
    cursor.close
    return jsonify(response)



if __name__ == '__main__':
    app.run(debug=True)