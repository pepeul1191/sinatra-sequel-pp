# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
# app/controllers/amenaza.rb

class Amenaza < Controller
    def initialize
        @amenazas = load_model("amenazas")
    end
    
    def listar
        @amenazas.listar
    end

    def obtener(id)
        @amenazas.obtener(id)
    end

    def obtener_grupos(id)
        @amenazas.obtener_grupos(id)
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
            rpta = { :tipo_mensaje => "success", :mensaje => ["Se ha registrado los cambios en las amenazas", array_nuevos] }.to_json
        rescue StandardError => e #ZeroDivisionError
            rpta = { :tipo_mensaje => "error", :mensaje => ["Se ha producido un error en guardar la tabla de amenazas", e] }.to_json
        end

        rpta
    end

    def crear
        codigo = params[:codigo]
        descripcion = params[:descripcion]
        begin
            id_generado = @amenazas.crear(codigo, descripcion)
            rpta = { :tipo_mensaje => "success", :mensaje => ["Se ha añadido una nueva amenaza", id_generado] }.to_json
        rescue
            rpta = { :tipo_mensaje => "error", :mensaje => ["Se ha producido un error en crear la nueva amenaza", e] }.to_json
        end
        rpta
    end

    def editar
        id = params[:id]
        codigo = params[:codigo]
        descripcion = params[:descripcion]
        begin
            @amenazas.editar(id, codigo, descripcion)
            rpta = { :tipo_mensaje => "success", :mensaje => ["Se ha editado una amenaza"] }.to_json
        rescue
            rpta = { :tipo_mensaje => "error", :mensaje => ["Se ha producido un error en editar la amenaza", e] }.to_json
        end
        rpta
    end

    private
    def eliminar(id)
        @amenazas.eliminar(id)
    end

    def asociar_grupo
        data = JSON.parse(params[:data])
        begin
            id_amenaza = data['id_amenaza']
            data['grupos_check'].each do |item|
                if item['valor'] == true
                    if @amenazas.existe_asociacion(id_amenaza, item['grupo_activo_id']) == 0
                        @amenazas.asociar_grupo(id_amenaza, item['grupo_activo_id'])
                    end
                else
                    @amenazas.desasociar_grupo(id_amenaza, item['grupo_activo_id'])
                end
            end
            rpta = { :tipo_mensaje => "success", :mensaje => ["Se ha asociado los grupos de activos a la amenaza"] }.to_json
        rescue ZeroDivisionError => e #StandardError
            rpta = { :tipo_mensaje => "error", :mensaje => ["Ha ocurrido un error al asociar los grupos de activos a la amenaza", e] }.to_json
        end 
        rpta
    end
end