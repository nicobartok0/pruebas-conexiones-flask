from flask import Flask, request
import pymysql
import json
from datetime import datetime, timedelta

# Crear una instancia de la aplicación Flask
app = Flask(__name__)

# Función para convertir objetos datetime/timedelta a cadenas
def convert_to_str(obj):
    if isinstance(obj, datetime):
        return obj.strftime('%Y-%m-%d %H:%M:%S')  # Formato DATETIME
    elif isinstance(obj, timedelta):
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
def home():
    return 'Home'

# Obtener todas las sucursales
@app.route('/obtener_sucursales')
def obtener_sucursales():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT nombre FROM sucursales')
    sucs = cursor.fetchall()
    return sucs

@app.route('/obtener_funciones')
def obtener_funciones():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT nombre_funcion FROM funcion')
    res = cursor.fetchall()
    conn.close()
    return res

@app.route('/obtener_novedades')
def obtener_novedades():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT nombre_novedad FROM novedades')
    res = cursor.fetchall()
    conn.close()
    return res


# Tomar todos los movimientos
@app.route('/obtener_movimientos')
def obtener_movimientos():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT fecha, id_movimiento, categoria, metodo_pago, monto, observacion, tipo, sucursales.nombre AS area FROM movimientos INNER JOIN sucursales ON sucursales.id_sucursal = movimientos.sucursal_fk ORDER BY fecha')
    data = cursor.fetchall()
    conn.close()
    return data

# Tomar todos los ingresos
@app.route('/obtener_monto_ingresos')
def obtener_monto_ingresos():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT COUNT(*) AS cantidad_movimientos, SUM(monto) FROM movimientos WHERE movimientos.tipo= \'INGRESO\'')
    data = cursor.fetchall()
    conn.close()
    return data

# Tomar todos los egresos
@app.route('/obtener_monto_egresos')
def obtener_monto_egresos():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT COUNT(*) AS cantidad_movimientos, SUM(monto) FROM movimientos WHERE movimientos.tipo= \'EGRESO\'')
    data = cursor.fetchall()
    conn.close()
    return data


# Listar todos los empleados con sus horarios y turnos_dias
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
    
# Listar horas trabajadas en un rango de fechas por empleado
@app.route('/listar_horas_totales_empleados')
def listar_horas_totales_empleados():
    conn = get_db_connection()
    cursor = conn.cursor()
    data = request.get_json()
    cursor.execute(f'''
    SELECT empleados.nombre, empleados.apellido, SUM(TIMESTAMPDIFF(SECOND, hs_entrada, hs_salida) / 3600) AS horas_trabajadas 
    FROM marcas_reloj 
        INNER JOIN empleados ON marcas_reloj.id_empleado_fk = empleados.legajo 
    WHERE fecha_marca 
    BETWEEN '{data['fecha_inicio']}' AND '{data['fecha_fin']}' 
    GROUP BY empleados.nombre, empleados.apellido 
    ORDER BY empleados.nombre, empleados.apellido;
    ''')
    info = cursor.fetchall()
    return info

# Listar horas trabajadas en un rango de fechas por un empleado en particular
@app.route('/listar_horas_totales_empleado')
def listar_horas_totales_empleado():
    conn = get_db_connection()
    cursor = conn.cursor()
    data = request.get_json()
    cursor.execute(f'''
    SELECT empleados.nombre, empleados.apellido, SUM(TIMESTAMPDIFF(SECOND, hs_entrada, hs_salida) / 3600) AS horas_trabajadas 
    FROM marcas_reloj 
        INNER JOIN empleados ON marcas_reloj.id_empleado_fk = empleados.legajo 
    WHERE fecha_marca 
    BETWEEN '{data['fecha_inicio']}' AND '{data['fecha_fin']}'
    AND empleados.num_empleado = '{data['n_empleado']}' 
    GROUP BY empleados.nombre, empleados.apellido 
    ORDER BY empleados.nombre, empleados.apellido;
    ''')
    info = cursor.fetchall()
    return info

@app.route('/marcas')
def marcas():
    conn = get_db_connection()
    cursor = conn.cursor()
    data = request.get_json()
    print(data)
    query = f"""
    SELECT 
    e.num_empleado, 
    mr.fecha_marca, 
    DAYOFWEEK(mr.fecha_marca) AS 'dia', 
    e.nombre, 
    e.apellido, 
    s.nombre AS 'sucursal', 
    f.nombre_funcion, 
    h.horario_entrada, 
    mr.hs_entrada, 
    mr.hs_almuerzo_inicio AS inicio_almuerzo,
    mr.hs_almuerzo_fin AS fin_almuerzo,
    h.horario_salida, 
    mr.hs_salida, 
    TIMEDIFF(mr.hs_salida, mr.hs_entrada) AS 'horas_trabajadas',
    n.nombre_novedad, 
    mr.observaciones 
    FROM empleados e 
    INNER JOIN marcas_reloj mr ON mr.id_empleado_fk = e.legajo 
    INNER JOIN sucursales s ON e.sucursal_fk = s.id_sucursal 
    INNER JOIN funcion f ON e.funcion_fk = f.id_funcion 
    INNER JOIN novedades n ON n.id_novedad = mr.novedad_fk 
    INNER JOIN emp_hor eh ON e.legajo = eh.legajo_fk 
    INNER JOIN turno_dias td ON eh.turno_dia_fk = td.id_turno_dia 
    INNER JOIN horarios h ON h.id_horario = eh.id_horario_fk 
    WHERE 1=1
    """
    # FILTROS: desde fecha_inicio hasta fecha_fin, sucursal, N° Empleado, Novedad, Nombre empleado (se parece a), Función
    if data['fecha_inicio'] != '' and data['fecha_fin'] != '':
        query += f' AND mr.fecha_marca BETWEEN \'{data['fecha_inicio']}\' AND \'{data['fecha_fin']}\''
    if data['sucursal'] != '':
        query += f' AND s.nombre = \'{data['sucursal']}\''
    if data['n_empleado'] != '':
        query += f' AND e.num_empleado = {data['n_empleado']}'
    if data['novedad'] != '':
        query += f' AND mr.novedad_fk = (SELECT n.id_novedad WHERE n.nombre_novedad = \'{data['novedad']}\')'
    if data['nombre'] != '':
        query += f' AND e.nombre LIKE \'%{data['nombre']}%\' OR e.apellido LIKE \'%{data['nombre']}%\''  
    if data['funcion'] != '':
        query += f' AND f.nombre_funcion = \'{data['funcion']}\''
    
    query += """
    AND (
    -- Filtrar lunes a viernes
    (td.turno_dia_desc = 'Lunes a Viernes' AND DAYOFWEEK(mr.fecha_marca) BETWEEN 2 AND 6)
    -- Filtrar sábado
    OR (td.turno_dia_desc = 'Sábado' AND DAYOFWEEK(mr.fecha_marca) = 7)
    -- Filtrar domingo
    OR (td.turno_dia_desc = 'Domingo' AND DAYOFWEEK(mr.fecha_marca) = 1)
)
ORDER BY  mr.fecha_marca, e.num_empleado;
    """
     
    cursor.execute(query)
    res = cursor.fetchall()
    try:
        return json.dumps(res, default=str)
    except:
        return 'error'

@app.route('/marcas_horasxsemana')
def marcas_horasxsemama():
    conn = get_db_connection()
    cursor = conn.cursor()
    data = request.get_json()
    print(data)
    query = """
    SELECT 
    e.num_empleado, 
    e.nombre, 
    e.apellido, 
    s.nombre AS 'sucursal',
    YEAR(mr.fecha_marca) AS 'año',
    WEEK(mr.fecha_marca, 1) AS 'semana', 
    SUM(TIMESTAMPDIFF(SECOND, mr.hs_entrada, mr.hs_salida)) / 3600 AS 'horas_trabajadas'  
    FROM empleados e 
    INNER JOIN marcas_reloj mr ON mr.id_empleado_fk = e.legajo 
    INNER JOIN sucursales s ON e.sucursal_fk = s.id_sucursal 
    INNER JOIN emp_hor eh ON e.legajo = eh.legajo_fk 
    INNER JOIN turno_dias td ON eh.turno_dia_fk = td.id_turno_dia 
    INNER JOIN horarios h ON h.id_horario = eh.id_horario_fk 
    INNER JOIN novedades n ON mr.novedad_fk = n.id_novedad
    WHERE 1 = 1
    AND (
    
    (td.turno_dia_desc = 'Lunes a Viernes' AND DAYOFWEEK(mr.fecha_marca) BETWEEN 2 AND 6)
    
    OR (td.turno_dia_desc = 'Sábado' AND DAYOFWEEK(mr.fecha_marca) = 7)
    
    OR (td.turno_dia_desc = 'Domingo' AND DAYOFWEEK(mr.fecha_marca) = 1)
)

    """
    # FILTROS: desde fecha_inicio hasta fecha_fin, sucursal, N° Empleado, Novedad, Nombre empleado (se parece a), Función
    if data['fecha_inicio'] != '' and data['fecha_fin'] != '':
        query += f' AND mr.fecha_marca BETWEEN \'{data['fecha_inicio']}\' AND \'{data['fecha_fin']}\''
    if data['sucursal'] != '':
        query += f' AND s.nombre = \'{data['sucursal']}\''
    if data['n_empleado'] != '':
        query += f' AND e.num_empleado = {data['n_empleado']}'
    if data['novedad'] != '':
        query += f' AND mr.novedad_fk = (SELECT novedades.id_novedad WHERE novedades.nombre_novedad = \'{data['novedad']}\')'
    if data['nombre'] != '':
        query += f' AND (e.nombre LIKE \'%{data['nombre']}%\' OR e.apellido LIKE \'%{data['nombre']}%\')'  
    if data['funcion'] != '':
        query += f' AND f.nombre_funcion = \'{data['funcion']}\''
    
    query += """
GROUP BY e.num_empleado, YEAR(mr.fecha_marca), WEEK(mr.fecha_marca, 1)
ORDER BY e.num_empleado, semana;
    """
    
    cursor.execute(query)
    res = cursor.fetchall()
    try:
        return json.dumps(res, default=str)
    except:
        return 'error'

# Añadir varios movimientos
# JSON {tipo:str, fecha:str, categoria:str, metodo_pago:str, monto:int, area:str, obs:str}
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

# Iniciar la aplicación
if __name__ == '__main__':
    app.run(debug=True)
