# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/grupo_activos.rb

class Grupo_activos  < Model
	def listar
		stringify(@connection.query('SELECT id, nombre, 0 AS existe FROM grupo_activos'))
	end

    def crear(nombre)
    		stmt = @connection.prepare('INSERT INTO grupo_activos (nombre) VALUES (?)')
    		stmt.execute(nombre)
    		@connection.last_id
    end

    def editar(id, nombre)
    		stmt = @connection.prepare('UPDATE grupo_activos SET nombre = ? WHERE id = ?')
    		stmt.execute(nombre, id)
    end

    def eliminar(id)
    		stmt = @connection.prepare('DELETE FROM grupo_activos WHERE id = ?')
    		stmt.execute(id)
    end
end