# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/vulnerabilidades.rb

class Vulnerabilidades < Model
 def listar
  stringify(@connection.query('SELECT  id, codigo, descripcion, 0 AS existe  FROM vulnerabilidades'))
 end

    def  obtener(id)
        stmt = @connection.prepare('SELECT * FROM vulnerabilidades WHERE id=?')
        rs = stmt.execute(id)
        rpta = ""
        rs.each do |row|
             rpta << JSON[row]
        end
        rpta
    end

    def obtener_grupos(id)
        stmt = @connection.prepare('
             SELECT T.id, T.nombre, (CASE WHEN (P.existe = 1) THEN 1 ELSE 0 END) AS existe FROM
             (
               SELECT id, nombre, 0 AS existe FROM grupo_activos
             ) T
             LEFT JOIN
             (
               SELECT G.id, G.nombre, 1 AS existe  FROM grupo_activos G 
               RIGHT JOIN vulnerabilidades_grupo_activos AG ON G.id = AG.grupo_activo_id
               WHERE AG.vulnerabilidad_id = ?
             ) P
             ON T.id = P.id')
         stringify(stmt.execute(id))
    end

    def crear(codigo, descripcion)
      stmt = @connection.prepare('INSERT INTO vulnerabilidades (codigo, descripcion) VALUES (?,?)')
      stmt.execute(codigo, descripcion)
      @connection.last_id
    end

    def editar(id, codigo, descripcion)
      stmt = @connection.prepare('UPDATE vulnerabilidades SET codigo = ?, descripcion = ? WHERE id = ?')
      stmt.execute(codigo, descripcion, id)
    end

    def eliminar(id)
      stmt = @connection.prepare('DELETE FROM vulnerabilidades WHERE id = ?')
      stmt.execute(id)
    end

    def existe_asociacion(vulnerabilidad_id, grupo_activo_id)
        stmt = @connection.prepare('SELECT COUNT(*) AS cantidad FROM vulnerabilidades_grupo_activos  WHERE vulnerabilidad_id = ? AND grupo_activo_id = ?')
         rs = stmt.execute(vulnerabilidad_id, grupo_activo_id)
         cantidad = ""
         rs.each do |row|
            cantidad = row['cantidad']
         end 
         Integer(cantidad)
    end

    def asociar_grupo(vulnerabilidad_id, grupo_activo_id)
         stmt = @connection.prepare('INSERT INTO vulnerabilidades_grupo_activos (vulnerabilidad_id, grupo_activo_id) VALUES (?,?)')
         rs = stmt.execute(vulnerabilidad_id, grupo_activo_id)
    end

    def desasociar_grupo(vulnerabilidad_id, grupo_activo_id)
         stmt = @connection.prepare('DELETE FROM vulnerabilidades_grupo_activos WHERE vulnerabilidad_id = ? AND grupo_activo_id = ?')
         stmt.execute(vulnerabilidad_id, grupo_activo_id)
    end
end