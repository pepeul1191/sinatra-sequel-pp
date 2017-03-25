# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/amenazas.rb

class Amenazas  < Model
	def listar
		stringify(@connection.query('SELECT id, codigo, descripcion, 0 AS existe FROM amenazas'))
	end

    def  obtener(id)
        stmt = @connection.prepare('SELECT * FROM amenazas WHERE id=?')
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
               RIGHT JOIN amenazas_grupo_activos AG ON G.id = AG.grupo_activo_id
               WHERE AG.amenaza_id = ?
             ) P
             ON T.id = P.id')
         stringify(stmt.execute(id))
    end

    def crear(codigo, descripcion)
    		stmt = @connection.prepare('INSERT INTO amenazas (codigo, descripcion) VALUES (?,?)')
    		stmt.execute(codigo, descripcion)
    		@connection.last_id
    end

    def editar(id, codigo, descripcion)
    		stmt = @connection.prepare('UPDATE amenazas SET codigo = ?, descripcion = ? WHERE id = ?')
    		stmt.execute(codigo, descripcion, id)
    end

    def eliminar(id)
    		stmt = @connection.prepare('DELETE FROM amenazas WHERE id = ?')
    		stmt.execute(id)
    end

    def existe_asociacion(amenaza_id, grupo_activo_id)
        stmt = @connection.prepare('SELECT COUNT(*) AS cantidad FROM amenazas_grupo_activos  WHERE amenaza_id = ? AND grupo_activo_id = ?')
         rs = stmt.execute(amenaza_id, grupo_activo_id)
         cantidad = ""
         rs.each do |row|
            cantidad = row['cantidad']
         end 
         Integer(cantidad)
    end

    def asociar_grupo(amenaza_id, grupo_activo_id)
         stmt = @connection.prepare('INSERT INTO amenazas_grupo_activos (amenaza_id, grupo_activo_id) VALUES (?,?)')
         rs = stmt.execute(amenaza_id, grupo_activo_id)
    end

    def desasociar_grupo(amenaza_id, grupo_activo_id)
         stmt = @connection.prepare('DELETE FROM amenazas_grupo_activos WHERE amenaza_id = ? AND grupo_activo_id = ?')
         stmt.execute(amenaza_id, grupo_activo_id)
    end
end