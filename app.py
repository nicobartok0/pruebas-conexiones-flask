from flask import Flask, request
import pymysql
import json
from datetime import datetime, timedelta

# Crear una instancia de la aplicación Flask
app = Flask(__name__)

# Función para convertir objetos datetime/timedelta a cadenas
def convert_to_str(obj):
    if isinstance(obj, datetime):
        print('SI')
        return obj.strftime('%Y-%m-%d %H:%M:%S')  # Formato DATETIME
    elif isinstance(obj, timedelta):
        print('SI')
        return str(obj)  # Puede ser útil para campos de tipo TIME
    return obj

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

@app.route('/obtener_sucursales')
def obtener_sucursales():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM sucursales')
    sucs = cursor.fetchall()
    return sucs

@app.route('/añadir_movimientos', methods=['POST'])
def añadir_movimiento():
    data = request.get_json()
    print(data)
    conn = get_db_connection()
    cursor = conn.cursor()
    for mov in data:
        query = f'INSERT INTO movimientos (tipo, fecha, categoria, metodo_pago, monto, sucursal_fk, observacion) VALUES (\"{mov['tipo']}\", \"{mov['fecha']}\", \"{mov['categoria']}\", \"{mov['metodo_pago']}\", {mov['monto']}, (SELECT id_sucursal FROM sucursales WHERE sucursales.nombre = \'{mov['area']}\'), \"{mov['observacion']}\")'
        print(query)
        cursor.execute(query)
    conn.commit()
    conn.close()
    return 'Éxito'
    
@app.route('/listar_empleados_horarios')
def listar_empleados_horarios():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT empleados.legajo, empleados.nombre, empleados.apellido, horarios.horario_entrada AS \'Entrada_Gral.\', horarios.horario_salida AS \'Salida_Gral.\', turno_dias.turno_dia_desc FROM emp_hor eh INNER JOIN empleados ON legajo_fk = empleados.legajo INNER JOIN horarios ON id_horario_fk = horarios.id_horario INNER JOIN turno_dias ON turno_dia_fk = turno_dias.id_turno_dia')
    res = cursor.fetchall()

    for result in res:
        result = {key: convert_to_str(value) for key, value in result.items()}
        
    conn.commit()
    conn.close()
    return json.dumps(result)
    
# Iniciar la aplicación
if __name__ == '__main__':
    app.run(debug=True)
