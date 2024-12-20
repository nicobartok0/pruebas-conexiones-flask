from flask import Flask, request
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

@app.route('/añadir_movimiento', methods=['POST'])
def añadir_movimiento():
    data = request.get_json()
    print(data)
    conn = get_db_connection()
    cursor = conn.cursor()
    query = f'INSERT INTO movimientos (tipo, fecha, categoria, metodo_pago, monto, sucursal_fk, observacion) VALUES (\"{data['tipo']}\", \"{data['fecha']}\", \"{data['categoria']}\", \"{data['metodo_pago']}\", {data['monto']}, {data['sucursal_fk']}, \"{data['observacion']}\")'
    print(query)
    cursor.execute(query)
    conn.commit()
    conn.close()
    return 'Éxito'
    

# Iniciar la aplicación
if __name__ == '__main__':
    app.run(debug=True)
