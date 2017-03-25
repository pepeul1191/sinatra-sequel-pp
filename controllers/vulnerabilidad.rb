# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/controllers/vulnerabilidad.rb

class Vulnerabilidad < Controller
    def initialize
        @vulnerabilidades = load_model("vulnerabilidades")
    end
    
    def listar
        @vulnerabilidades.listar
    end

    def obtener(id)
        @vulnerabilidades.obtener(id)
    end

    def obtener_grupos(id)
        @vulnerabilidades.obtener_grupos(id)
    end

    def guardar
        data = params[:data]
        array_json_tabla = JSON.parse(data)

        nuevos = array_json_tabla["nuevos"]
        editados = array_json_tabla["editados"]
        eliminados = array_json_tabla["eliminados"]

        begin
            if !eliminados.empty?
                for i in 0..eliminados.length - 1
                    id = eliminados[i]

                    eliminar(id)
                end
            end
            rpta = { :tipo_mensaje => "success", :mensaje => ["Se ha registrado los cambios en las vulnerabilidades", array_nuevos] }.to_json
        rescue StandardError => e #ZeroDivisionError
            rpta = { :tipo_mensaje => "error", :mensaje => ["Se ha producido un error en guardar la tabla de vulnerabilidades", e] }.to_json
        end

        rpta
    end

    def crear
        codigo = params[:codigo]
        descripcion = params[:descripcion]
        begin
            id_generado = @vulnerabilidades.crear(codigo, descripcion)
            rpta = { :tipo_mensaje => "success", :mensaje => ["Se ha añadido una nueva vulnerabilidad", id_generado] }.to_json
        rescue
            rpta = { :tipo_mensaje => "error", :mensaje => ["Se ha producido un error en crear la nueva vulnerabilidad", e] }.to_json
        end
        rpta
    end

    def editar
        id = params[:id]
        codigo = params[:codigo]
        descripcion = params[:descripcion]
        begin
            @vulnerabilidades.editar(id, codigo, descripcion)
            rpta = { :tipo_mensaje => "success", :mensaje => ["Se ha editado una vulnerabilidad"] }.to_json
        rescue
            rpta = { :tipo_mensaje => "error", :mensaje => ["Se ha producido un error en editar la vulnerabilidad", e] }.to_json
        end
        rpta
    end

    private
    def eliminar(id)
        @vulnerabilidades.eliminar(id)
    end

    def asociar_grupo
        data = JSON.parse(params[:data])
        begin
            id_vulnerabilidad = data['id_vulnerabilidad']
            data['grupos_check'].each do |item|
                if item['valor'] == true
                    if @vulnerabilidades.existe_asociacion(id_vulnerabilidad, item['grupo_activo_id']) == 0
                        @vulnerabilidades.asociar_grupo(id_vulnerabilidad, item['grupo_activo_id'])
                    end
                else
                    @vulnerabilidades.desasociar_grupo(id_vulnerabilidad, item['grupo_activo_id'])
                end
            end
            rpta = { :tipo_mensaje => "success", :mensaje => ["Se ha asociado los grupos de activos a la vulnerabilidad"] }.to_json
        rescue ZeroDivisionError => e #StandardError
            rpta = { :tipo_mensaje => "error", :mensaje => ["Ha ocurrido un error al asociar los grupos de activos a la vulnerabilidad", e] }.to_json
        end 
        rpta
    end
end