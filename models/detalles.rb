# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/models/detalles.rb

class Detalles  < Model
	#atributos :  id, id_error, detalle

	def crear(id_error, detalle)
		stm = @connection.prepare "INSERT INTO detalles (id_error, detalle) VALUES (?, ?);"
		stm.bind_param 1, id_error
		stm.bind_param 2, detalle
		stm.execute
	end

	def obtener(id_error)
		stm = @connection.prepare  "SELECT detalle FROM detalles WHERE id_error = ?"
		stm.bind_param 1, id_error
		stringify(stm.execute)
	end
end