# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/controllers/ubicacion.rb

class Ubicacion < Controller
    def initialize
        @ubicaciones = load_model("ubicaciones")
    end
    
    def listar
        @ubicaciones.listar
    end

    def guardar
        data = params[:data]
        array_json_tabla = JSON.parse(data)

        nuevos = array_json_tabla["nuevos"]
        editados = array_json_tabla["editados"]
        eliminados = array_json_tabla["eliminados"]

        begin
            if !nuevos.empty?
                array_nuevos = Array.new
                for i in 0..nuevos.length - 1
                    temp_id = nuevos[i]['id']
                    nombre = nuevos[i]['nombre']#.gsub(" ", "%20") 
                    nuevo = crear(temp_id, nombre)
                    array_nuevos.push(nuevo)
                end
            end
            if !editados.empty?
                for i in 0..editados.length - 1
                    id = editados[i]['id']
                    nombre = editados[i]['nombre']#.gsub(" ", "%20") #esto es para reemplazar los espacios en blanco porque httparty arroja error

                    editar(id, nombre)
                end
            end
            if !eliminados.empty?
                for i in 0..eliminados.length - 1
                    id = eliminados[i]

                    eliminar(id)
                end
            end
            rpta = { :tipo_mensaje => "success", :mensaje => ["Se ha registrado los cambios en las ubicaciones", array_nuevos] }.to_json
        rescue ZeroDivisionError => e #StandardError
            rpta = { :tipo_mensaje => "error", :mensaje => ["Se ha producido un error en guardar la tabla de ubicaciones", e] }.to_json
        end

        rpta
    end

    private
    def crear(temp_id, nombre)
        id_generado = @ubicaciones.crear(nombre)
        {:temporal => temp_id, :nuevo_id => id_generado}
    end

    private
    def editar(id, nombre)
        @ubicaciones.editar(id, nombre)
    end

    private
    def eliminar(id)
        @ubicaciones.eliminar(id)
    end
end