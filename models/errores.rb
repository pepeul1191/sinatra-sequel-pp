# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/errores.rb

class Errores  < Model
	#atributos :  id, usuario, sistema, momento, error
	def crear(usuario, sistema,error)
		stm = @connection.prepare 'INSERT INTO errores (usuario, sistema, momento, error) VALUES (?, ?,DATETIME("now","localtime") ,?);'
		stm.bind_param 1, usuario
		stm.bind_param 2, sistema
		stm.bind_param 3, error
		stm.execute
		@connection.last_insert_row_id() 
	end

	def listar(query)
		@connection.results_as_hash = true
		stringify(@connection.execute query.to_s)
	end
end