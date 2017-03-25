# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/controllers/error.rb

class Detalle < Controller
	#atributos :  id, usuario, sistema, momento, error
    def initialize
        @detalles = load_model("detalles")
    end

	def crear(id_error, detalle)
        @detalles.crear(id_error, detalle)
	end

   def obtener(id_error)
       @detalles.obtener(id_error)
   end
end