# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/ubicaciones.rb

class Ubicaciones  < Model
	def listar
		stringify(@connection.query('SELECT * FROM ubicaciones'))
	end

    def crear(nombre)
    		stmt = @connection.prepare('INSERT INTO ubicaciones (nombre) VALUES (?)')
    		stmt.execute(nombre)
    		@connection.last_id
    end

    def editar(id, nombre)
    		stmt = @connection.prepare('UPDATE ubicaciones SET nombre = ? WHERE id = ?')
    		stmt.execute(nombre, id)
    end

    def eliminar(id)
    		stmt = @connection.prepare('DELETE FROM ubicaciones WHERE id = ?')
    		stmt.execute(id)
    end
end