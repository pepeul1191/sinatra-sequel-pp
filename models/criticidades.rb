# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/criticidades.rb

class Criticidades  < Model
	def listar
		stringify(@connection.query('SELECT  id, grado, descripcion, 0 AS existe  FROM criticidades'))
	end

    def crear(grado, descripcion)
    		stmt = @connection.prepare('INSERT INTO criticidades (grado, descripcion) VALUES (?,?)')
    		stmt.execute(grado, descripcion)
    		@connection.last_id
    end

    def editar(id, grado, descripcion)
    		stmt = @connection.prepare('UPDATE criticidades SET grado = ?, descripcion = ? WHERE id = ?')
    		stmt.execute(grado, descripcion, id)
    end

    def eliminar(id)
    		stmt = @connection.prepare('DELETE FROM criticidades WHERE id = ?')
    		stmt.execute(id)
    end
end