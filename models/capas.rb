# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/capas.rb

class Capas  < Model
	def listar
		stringify(@connection.query('SELECT * FROM capas'))
	end

    def crear(nombre)
    		stmt = @connection.prepare('INSERT INTO capas (nombre) VALUES (?)')
    		stmt.execute(nombre)
    		@connection.last_id
    end

    def editar(id, nombre)
    		stmt = @connection.prepare('UPDATE capas SET nombre = ? WHERE id = ?')
    		stmt.execute(nombre, id)
    end

    def eliminar(id)
    		stmt = @connection.prepare('DELETE FROM capas WHERE id = ?')
    		stmt.execute(id)
    end
end