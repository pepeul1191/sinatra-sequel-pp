# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/controllers/error.rb

class Error < Controller
	#atributos :  id, usuario, sistema, momento, error
    def initialize
        @errores = load_model("errores")
    end

    def crear
        if params[:error].split(//).last(3).join != "ico"
            id_error = @errores.crear(params[:usuario], params[:sistema], params[:error])
            @detalle = load_controller("detalle")
            @detalle.crear(id_error, params[:detalle])
        end
    end

    def listar
        query = "SELECT * FROM errores LIMIT 0,1"
        @errores.listar(query)
    end
end