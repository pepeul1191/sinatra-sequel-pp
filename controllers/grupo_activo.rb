# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/controllers/grupo_activo.rb

class Grupo_activo < Controller
    def initialize
        @grupo_activos = load_model("grupo_activos")
    end
    
    def listar
        @grupo_activos.listar
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
            rpta = { :tipo_mensaje => "success", :mensaje => ["Se ha registrado los cambios en los grupos de activo", array_nuevos] }.to_json
        rescue ZeroDivisionError => e #StandardError
            rpta = { :tipo_mensaje => "error", :mensaje => ["Se ha producido un error en guardar la tabla de grupos de activos", e] }.to_json
        end

        rpta
    end

    private
    def crear(temp_id, nombre)
        id_generado = @grupo_activos.crear(nombre)
        {:temporal => temp_id, :nuevo_id => id_generado}
    end

    private
    def editar(id, nombre)
        @grupo_activos.editar(id, nombre)
    end

    private
    def eliminar(id)
        @grupo_activos.eliminar(id)
    end
end