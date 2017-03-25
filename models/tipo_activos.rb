# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/tipo_activos.rb

class Tipo_activos  < Model
	def listar
		stringify(@connection.query('SELECT * FROM tipo_activos'))
	end

    def crear(nombre)
    		stmt = @connection.prepare('INSERT INTO tipo_activos (nombre) VALUES (?)')
    		stmt.execute(nombre)
    		@connection.last_id
    end

    def editar(id, nombre)
    		stmt = @connection.prepare('UPDATE tipo_activos SET nombre = ? WHERE id = ?')
    		stmt.execute(nombre, id)
    end

    def eliminar(id)
    		stmt = @connection.prepare('DELETE FROM tipo_activos WHERE id = ?')
    		stmt.execute(id)
    end
end