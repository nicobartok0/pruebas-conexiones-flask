from flask import Flask
import pymysql
# Crear una instancia de la aplicación Flask
app = Flask(__name__)

# Establecer la conexión
def get_db_connection():
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='',
        db='ilporco_pruebas',
        cursorclass=pymysql.cursors.DictCursor
    )
    return connection

# Definir una ruta
@app.route('/')
def hello_world():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM sucursales')
    sucs = cursor.fetchall()
    return sucs



# Iniciar la aplicación
if __name__ == '__main__':
    app.run(debug=True)
